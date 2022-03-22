//
//  File.swift
//
//
//  Created by Jonathan Badger on 12/27/21.
//

import Foundation

import ncurses


/**
 Passing all zeros for location and size creates a full screen window
 */
public class Window {
    private var windowP: UnsafeMutablePointer<WINDOW>!
    private let colors = Colors.shared

    public private(set) var cursor : Cursor
    public private(set) var keypadEnabled: Bool = true

    ///The upper left corner of the window (beginning location)
    public var location: Location {
        return Location(x:getbegx(windowP), y:getbegy(windowP))
    }

    public var size: Size {
        let location = self.location
        let maxX = getmaxx(windowP)
        let maxY = getmaxx(windowP)
        return Size(width: maxX - location.x, height: maxY - location.y)
    }


    //WINDOW *newwin(int nlines, int ncols, int begin_y, int begin_x);
    public init?(size: Size, location: Location, keypadEnabled: Bool = true) {
        if let winP = newwin(size.height, size.width, location.y, location.x) {
            self.windowP = winP
            self.cursor = Cursor(window:winP)
            self.set(keypadEnabled: keypadEnabled)

        } else {
            return nil
        }
    }

    deinit {
        delwin(windowP)
    }

    /// Turn extended keypad support on or off
    public func set(keypadEnabled: Bool) {
        if keypadEnabled {
            keypad(windowP, true)
        } else {
            keypad(windowP, false)
        }
        self.keypadEnabled = keypadEnabled
    }

    //WINDOW *dupwin(WINDOW *win);

    /// Moves the window so its upper left corner is at the specified location
    /// int mvwin(WINDOW *win, int y, int x);
    public func move(toLocation location: (x: Int32, y: Int32)) {
        //TODO add error handling for offscreen window drawing
        mvwin(windowP, location.y, location.x)
    }

    /// Refreshes the observed output on standard screen
    public func refresh() {
        wrefresh(windowP)
    }

    public func deleteCurrentCharacter() {
        wdelch(windowP)
    }

    public func deleteLastCharacter() {
        let location = Location(x: cursor.location.x - 1, y: cursor.location.y)
        deletCharacter(atLocation: location)
    }

    public func deletCharacter(atLocation location: Location) {
        mvwdelch(windowP, location.y, location.x)
        mvdelch(location.y, location.x)
    }

    ///Returns all content in the window as a string.
    public func allContent() -> String {
        var contents = ""

        let cursorLocation = cursor.location
        for line in 0..<size.height {
            cursor.move(toLocation: Location(x: 0, y: line))
            var cchar = CChar()
            winstr(windowP, &cchar)
            var lineString = String(cString: &cchar).trimmingCharacters(in: .whitespaces)
            if line < size.height {
                lineString.append("\n")
            }
            contents.append(lineString)
        }
        contents = contents.trimmingCharacters(in: .newlines)
        cursor.move(toLocation: cursorLocation)
        return contents
    }

    ///Returns the contents of the current line beginning at the window's current cursor location specified.
    public func contents(startingAt startingLocation: Location? = nil) -> String {
        let currentLocation = cursor.location
        var cchar = CChar()
        if let startingLocation = startingLocation {
            mvwinstr(windowP, startingLocation.y, startingLocation.x, &cchar)
        } else {
            winstr(windowP, &cchar)
        }
        cursor.move(toLocation: currentLocation)
        return String(cString: &cchar).trimmingCharacters(in: .whitespaces)
    }
}

//scrolling extensions
extension Window {
    /// Indicates if scrolling has been turned on.
    ///
    /// See set(scrollingEnabled: Bool)
    public var canScroll: Bool {
        is_scrollok(self.windowP)
    }
    
    /// Turns scrolling behavior on and off for the window.
    func set(scrollingEnabled: Bool) throws {
        scrollok(self.windowP, scrollingEnabled)
    }

    /**Scrolls the window up exactly one line.

     Per the man pages:
     The  scroll routine scrolls the window up one line.  This involves mov-
            ing the lines in the window data structure.  As an optimization, if the
            scrolling  region  of  the  window  is  the entire screen, the physical
            screen may be scrolled at the same time.
     */
    func scrollLine() throws {
        if canScroll {
            ncurses.scroll(self.windowP)
        }
    }

    /**
     Scrolls the window up (+) or down (-) nRows number of rows
     */
    func scroll(nRows: Int32) throws {
        if canScroll {
            wscrl(self.windowP, nRows)

        }
    }
}

//Input functions
extension Window {
    public func getKey() -> Key {
        let rawValue = wgetch(windowP)
        return Key(rawValue: rawValue)
    }

    public func getString() -> String {
        var cChar = CChar()
        wgetstr(windowP, &cChar)
        return String(cString: &cChar)
    }
}

//text attribute extensions
extension Window {
    public var attributes: Attributes {
        var colorPairIndex : CShort = 0
        var attrT = attr_t()
        wattr_get(windowP, &attrT, &colorPairIndex, nil)
        let colorPair = Colors.shared.colorPairs[Int(colorPairIndex)]
        return [Attributes(rawValue: attrT), .colorPair(colorPair)]
    }

    ///Turns on specified text attributes for the Window output
    public func turnOnAttributes(_ attributes: Attributes) {
        wattron(windowP, Int32(attributes.rawValue))
    }

    ///Turns off specified text attributes for the Window output
    public func turnOffAttributes(_ attributes: Attributes) {
        wattroff(windowP, Int32(attributes.rawValue))
    }

    ///Sets the text attributes for the Window output
    public func setAttributes(_ attributes: Attributes) {
        wattrset(windowP, Int32(attributes.rawValue))
    }

    ///Sets the text attributes for the Window to stdout
    public func setAttributesToStdOut() {
        wstandout(windowP)

    }
}

//Output
extension Window {
    ///Prints a single character to the screen and advances the cursor postion
    public func print(key: Key, ignoreControlKeys: Bool = true) {
        guard key.rawValue > 0 else { return }
        if ignoreControlKeys {
            if key.isPrintableControlKey || key.type == .characterKey {
                waddch(windowP, chtype(key.rawValue))
            }
        } else {
            waddch(windowP, chtype(key.rawValue))
        }
    }

    public func print(_ string: String, attributes: Attributes? = nil, location: Location? = nil) {
        let windowAttributes = self.attributes
        if let attributes = attributes {
            setAttributes(attributes)
        }
        if let location = location {
            mvwaddstr(windowP, location.y, location.x, string)
        } else {
            waddstr(windowP, string)
        }
        setAttributes(windowAttributes)
    }

}
