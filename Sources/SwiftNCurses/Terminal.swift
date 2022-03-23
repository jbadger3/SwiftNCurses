//  Created by Jonathan Badger on 12/27/21.
//

import Foundation
import ncurses

/**
 The ``Terminal`` class is used as a basis initiation and control of SwiftNCurses programs.

 */
public class Terminal {
    ///The number of lines in the terminal
    public var lines: Int32 {
        get {
            return LINES
        }
    }
    ///The number of columns in the terminal
    public var columns: Int32 {
        get {
            return COLS
        }
    }
    //Terminal attributes

    //char *longname(void);
    var longName: String {
        return String(cString: longname())
    }
    /*
     int baudrate(void);
     char erasechar(void);
     int erasewchar(wchar_t *ch);
     bool has_ic(void);
     bool has_il(void);
     char killchar(void);
     int killwchar(wchar_t *ch);

     attr_t term_attrs(void);
     chtype termattrs(void);
     char *termname(void);
     */
    //*** Used for unit testing
    private var screen: OpaquePointer!
    private var stdinP: UnsafeMutablePointer<FILE>!
    private var stdoutP: UnsafeMutablePointer<FILE>!
    //***

    public private(set) var standardScreen: UnsafeMutablePointer<WINDOW>!
    ///The current input mode for the current program (defaults to raw). See ``InputMode`` for a list of all available modes.
    public private(set) var currentMode: InputMode = .raw
    ///Indicates whether the current termial echos each keypress back to the terminal (defaults to false)
    public private(set) var echoing: Bool = false

    public private(set) var keypadEnabled: Bool = true
    ///The cursor associated with the terminal
    public let cursor: Cursor
    ///A shared singleton to track colors used by the program
    public let colors = Colors.shared

    //Output attributes
    public var attributes: Attributes {
        var colorPairIndex : CShort = 0
        var attrT = attr_t()
        attr_get(&attrT, &colorPairIndex, nil)
        var currentAttributes = Attributes(rawValue: attrT)
        if Int(colorPairIndex) < Colors.shared.colorPairs.count{
            let colorPair = Colors.shared.colorPairs[Int(colorPairIndex)]
            let colorAttributtes: Attributes = [.colorPair(colorPair)]
            currentAttributes = currentAttributes.union(colorAttributtes)
        }
        return currentAttributes
    }

    ///Turns on specified text attributes for the Terminal output
    public func turnOnAttributes(_ attributes: Attributes) {
        attron(Int32(attributes.rawValue))
    }

    ///Turns off specified text attributes for the Terminal output
    public func turnOffAttributes(_ attributes: Attributes) {
        attroff(Int32(attributes.rawValue))
    }

    ///Sets the text attributes for the Terminal output
    public func setAttributes(_ attributes: Attributes) {
        attrset(Int32(attributes.rawValue))
    }

    ///Sets the text attributes for the Terminal to stdout
    public func setAttributesToStdOut() {
        standout()
    }

    public init(mode: InputMode = .raw, echoing: Bool = false, keypadEnabled: Bool = true, colorPalette: ColorPalette? = XTermPalette() as ColorPalette) {
        //check for unit testing
        if ProcessInfo.processInfo.environment["SWIFTNCURSES_TESTS"] != nil {
            if let tempDirectory = URL(string:NSTemporaryDirectory()) {
                let inputURL = tempDirectory.appendingPathComponent("\(UUID())")
                let outputURL = tempDirectory.appendingPathComponent("\(UUID())")
                self.stdinP = fopen(inputURL.absoluteString, "w")!
                self.stdoutP = fopen(outputURL.absoluteString, "w")!
                self.screen = newterm(nil, self.stdoutP, self.stdinP)
                set_term(self.screen)
            }
        } else {
            // sets the locale and associated available characters based on the calling program
            setlocale(LC_ALL, "")
            initscr()
            intrflush(stdscr, false)
        }
        self.standardScreen = stdscr
        self.cursor = Cursor(window: stdscr)
        self.set(mode: mode)
        self.set(echoing: echoing)
        self.set(keypadEnabled: keypadEnabled)
        if let colorPalette = colorPalette,
          colors.canChangeColors {
            start_color()
            colors.colorsEnabled = true
            colors.palette = colorPalette
        }
    }


    deinit {
        // release memory and return terminal to normal mode
        endwin()
        if ProcessInfo.processInfo.environment["SWIFTNCURSES_TESTS"] != nil {

        }
        // NEED TO RELEASE TEMP FILES AND SCREEN FOR TESTING
    }

    /**
    Sets the input mode of the terminal.

    */
    public func set(mode: InputMode) {
        switch mode {
        case .raw:
            raw()
        case .noraw:
            noraw()
        case .cbreak:
            cbreak()
        case .nocbreak:
            nocbreak()
        case .halfdelay(let timeout):
            halfdelay(Int32(timeout))
        }
        self.currentMode = mode
    }

    /// Turns output echoing on and off
    public func set(echoing: Bool) {
        if echoing {
            echo()
        } else {
            noecho()
        }
        self.echoing = echoing
    }

    /// Turn extended keypad support on or off
    public func set(keypadEnabled: Bool) {
        if keypadEnabled {
            keypad(self.standardScreen, true)
        } else {
            keypad(self.standardScreen, false)
        }
        self.keypadEnabled = keypadEnabled
    }

    ///scroll
    ///int scrl(int n);



    /* call on refresh to terminal seems to cause fatal error
    //Refresh
    public func refresh() {
        refresh()
    }
    */

    ///Quits the current program.
    public func quit() {
        // release memory and return terminal to normal mode
        endwin()
        exit(0)
    }

    ///Deletes the current character occupied by the cursor.
    public func deleteCurrentCharacter() {
        delch()
    }

    ///Deletes the character preceding the current cursor location.
    public func deleteLastCharacter() {
        let location = Location(x: cursor.location.x - 1, y: cursor.location.y)
        deleteCharacter(atLocation: location)
    }

    ///Deletes a character at a specified location
    public func deleteCharacter(atLocation location: Location) {
        mvdelch(location.y, location.x)
    }

    ///Returns all content in the window as a string.
    public func allContent() -> String {
        var contents = ""

        let cursorLocation = cursor.location
        for line in 0..<lines {
            cursor.move(toLocation: Location(x: 0, y: line))
            var cchar = CChar()
            instr(&cchar)
            var lineString = String(cString: &cchar).trimmingCharacters(in: .whitespaces)
            if line < lines {
                lineString.append("\n")
            }
            contents.append(lineString)
        }
        contents = contents.trimmingCharacters(in: .newlines)
        cursor.move(toLocation: cursorLocation)
        return contents
    }

    ///Returns the contents of the current line beginning at the window's current cursor location specified.
    public func contents(startingAt startingLocation: Location) -> String {
        var contents = ""

        let cursorLocation = cursor.location
        // **Note: this loop looks dumb, but removing it causes a segmentation fault...cchar being released too soon?!
        for line in 0..<1 {
            cursor.move(toLocation: startingLocation)
            var cchar = CChar()
            instr(&cchar)
            var lineString = String(cString: &cchar).trimmingCharacters(in: .whitespaces)

            contents.append(lineString)
        }
        contents = contents.trimmingCharacters(in: .newlines)
        cursor.move(toLocation: cursorLocation)
        return contents
    }

    //MARK: IO funcs

    public func getKey() -> Key {
        let rawValue = getch()
        return Key(rawValue: rawValue)
    }

    public func getString() -> String {
        var cChar = CChar()
        getstr(&cChar)
        return String(cString: &cChar)
    }

    ///Prints a single character to the screen and advances the cursor postion
    public func print(key: Key, ignoreControlKeys: Bool = true) {
        if ignoreControlKeys {
            if key.isPrintableControlKey || key.type == .characterKey {
                addch(chtype(key.rawValue))
            }
        } else if key.type != .negKey {
            addch(chtype(key.rawValue))
        }
    }

    public func print(_ string: String, attributes: Attributes? = nil, location: Location? = nil) {
        let terminalAttributes = self.attributes
        if let attributes = attributes {
            setAttributes(attributes)
        }
        if let location = location {
            mvaddstr(location.y, location.x, string)
        } else {
            addstr(string.cString(using:.utf8))
        }
        setAttributes(terminalAttributes)
    }
}
