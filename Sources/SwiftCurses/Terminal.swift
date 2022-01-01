
//  Created by Jonathan Badger on 12/27/21.
//

import Foundation
import ncurses

/**
 TODO
 
 */
public class Terminal {
    
    public static var shared = Terminal()
    
    public var lines: Int {
        get {
            return Int(LINES)
        } set {
            LINES = Int32(newValue)
        }
    }
    public var columns: Int {
        get {
            return Int(COLS)
        } set {
            COLS = Int32(newValue)
        }
    }
    
    public private(set) var standardScreen: UnsafeMutablePointer<WINDOW>!
    
    public private(set) var currentMode: InputMode = .raw
    
    public private(set) var echoing: Bool = false
    
    public private(set) var keypadEnabled: Bool = true
    
    public let cursor: Cursor
    
    public var hasColors: Bool {
        return has_colors()
    }
    public var canChangeColors: Bool {
        return can_change_color()
    }
    
    public var maxColors: Int {
        
        return Int(COLORS)
    }
    
    public private(set) var colorsEnabled: Bool = false
    

    
    /// Terminal is a singleton and should be accessed via Terminal.shared
    init(mode: InputMode = .raw, echoing: Bool = false, keypadEnabled: Bool = true) {
        // sets the locale and associated available characters based on the calling program
        setlocale(LC_ALL, "")
        ncurses.initscr()
        self.standardScreen = stdscr
        self.cursor = Cursor(window: stdscr)
        try? self.set(mode: mode)
        self.set(echoing: echoing)
        self.set(keypadEnabled: keypadEnabled)
        if hasColors {
            start_color()
            colorsEnabled = true
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
            ncurses.raw()
        case .noraw:
            ncurses.noraw()
        case .cbreak:
            ncurses.cbreak()
        case .nocbreak:
            ncurses.nocbreak()
        case .halfdelay(let timeout):
            if Range(1...255).contains(timeout) {
                ncurses.halfdelay(Int32(timeout))
            } else {
                //TODO throw error here
            }
        }
        self.currentMode = mode
    }
    
    /// Turns echoing on and off
    public func set(echoing: Bool) {
        if echoing {
            ncurses.echo()
        } else {
            ncurses.noecho()
        }
        self.echoing = echoing
    }
    
    /// Turn extended keypad support on or off
    public func set(keypadEnabled: Bool) {
        if keypadEnabled {
            ncurses.keypad(self.standardScreen, true)
        } else {
            ncurses.keypad(self.standardScreen, false)
        }
        self.keypadEnabled = keypadEnabled
    }
    
    ///scroll
    ///int scrl(int n);
    
    //int move(int y, int x);
    
    //Refresh
    public func refreshScreen() {
        refresh()
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
    public func getKey() -> Int32 {
        return getch()
    }
}

//Output attributes
extension Terminal {
    public var attributes: Attributes {
        var colorPair : CShort = 0
        var attrT = attr_t()
        attr_get(&attrT, &colorPair, nil)
        return Attributes(rawValue: attrT)
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
    public func setAttributesToStandOut() {
        standout()
    }
}

//Output
extension Terminal {
    ///Prints a single character to the screen and advances the cursor postion
    public func print(char: UTF32Char) {
        addch(char)
    }
    
    public func print(_ string: String, location: Location? = nil, attributes: Attributes? = nil, color: ColorPair? = nil) {
        if let attributes = attributes {
            turnOnAttributes(attributes)
        }
        if let color = color {
            attron(color.index)
        }
        if let location = location {
            mvaddstr(location.y, location.x, string)
        } else {
            addstr(string)
        }
        if let attributes = attributes {
            turnOffAttributes(attributes)
        }
        if let color = color {
            attroff(color.index)
        }
    }
    
}

