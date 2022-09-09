//  Created by Jonathan Badger on 12/27/21.
//

import Foundation
import ncurses

/**
 TODO
 
 */
public class Terminal {
    ///The number of lines in the terminal
    public var lines: Int32 {
        get {
            return LINES
        } set {
            LINES = newValue
        }
    }
    ///The number of columns in the terminal
    public var columns: Int32 {
        get {
            return COLS
        } set {
            COLS = newValue
        }
    }

    public private(set) var standardScreen: UnsafeMutablePointer<WINDOW>!
    ///The current input mode for the current program (defaults to raw). See ``InputMode`` for a list of all available modes.
    public private(set) var currentMode: InputMode = .raw
    ///Indicates whether the current termial echos each keypress back to the terminal (defaults to false)
    public private(set) var echoing: Bool = false
    
    public private(set) var keypadEnabled: Bool = true
    ///The cursor associated with the terminal
    public let cursor: Cursor
    ///Indicates if colored output is enabled.  Colors are enabled during instantiation of the Terminal object if the terminal supports color.
    public private(set) var colorsEnabled: Bool = false
    ///A shared singleton to track colors used by the program
    public let colors = Colors.shared
    ///
    public init(mode: InputMode = .raw, echoing: Bool = false, keypadEnabled: Bool = true, colorPalette: ColorPalette = XTermPalette() as ColorPalette) {
        // sets the locale and associated available characters based on the calling program
        setlocale(LC_ALL, "")
        initscr()
        self.standardScreen = stdscr
        self.cursor = Cursor(window: stdscr)
        try? self.set(mode: mode)
        self.set(echoing: echoing)
        self.set(keypadEnabled: keypadEnabled)
        
        if colors.canChangeColors {
            start_color()
            colorsEnabled = true
            colors.palette = colorPalette
        }
    }
    
    deinit {
        // release memory and return terminal to normal mode
        endwin()
        
    }
    
    /// Sets the input mode of the terminal.
    public func set(mode: InputMode) throws {
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
            if Range(1...255).contains(timeout) {
                halfdelay(Int32(timeout))
            } else {
                //TODO throw error here
            }
        }
        self.currentMode = mode
    }
    
    /// Turns echoing on and off
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
    
    //int move(int y, int x);
    
    /* call on refresh to terminal seems to cause fatal error
    //Refresh
    public func refresh() {
        refresh()
    }
    */
    
    public func quit() {
        // release memory and return terminal to normal mode
        endwin()
        exit(0)
    }
    
    public func deleteCurrentCharacter() {
        delch()
    }
    
    public func deleteLastCharacter() {
        let location = Location(x: cursor.location.x - 1, y: cursor.location.y)
        deletCharacter(atLocation: location)
    }
    
    public func deletCharacter(atLocation location: Location) {
        mvdelch(location.y, location.x)
    }
    
    ///Returns all content in the window as a string.
    public func allContent() -> String {
        var contents = ""
        
        let cursorLocation = cursor.location
        for line in 0..<lines {
            try? cursor.move(toLocation: Location(x: 0, y: line))
            var cchar = CChar()
            instr(&cchar)
            var lineString = String(cString: &cchar).trimmingCharacters(in: .whitespaces)
            if line < lines {
                lineString.append("\n")
            }
            contents.append(lineString)
        }
        contents = contents.trimmingCharacters(in: .newlines)
        try? cursor.move(toLocation: cursorLocation)
        return contents
    }
    
    ///Returns the contents of the current line beginning at the window's current cursor location specified.
    public func contents(startingAt startingLocation: Location? = nil) -> String {
        let currentLocation = cursor.location
        var cchar = CChar()
        if let startingLocation = startingLocation {
            mvinstr(startingLocation.y, startingLocation.x, &cchar)
        } else {
            instr(&cchar)
        }
        try? cursor.move(toLocation: currentLocation)
        return String(cString: &cchar).trimmingCharacters(in: .whitespaces)
    }
}

//terminal attributes
extension Terminal {
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
}

//Input
extension Terminal {
    public func getKey() -> Key {
        let rawValue = getch()
        return Key(rawValue: rawValue)
    }
    
    public func getString() -> String {
        var cChar = CChar()
        getstr(&cChar)
        return String(cString: &cChar)
    }
}

//Output attributes
extension Terminal {
    public var attributes: Attributes {
        var colorPairIndex : CShort = 0
        var attrT = attr_t()
        attr_get(&attrT, &colorPairIndex, nil)
        let colorPair = Colors.shared.colorPairs[Int(colorPairIndex)]
        return [Attributes(rawValue: attrT), .colorPair(colorPair)]
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

    

}

//Output
extension Terminal {
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
            addstr(string)
        }
        setAttributes(terminalAttributes)
    }
}



