
//  Created by Jonathan Badger on 12/27/21.
//

import Foundation
import ncurses

/**
 TODO
 
 */
public class Terminal {
    
    public enum Mode {
        ///
        /// Makes all keypresses immediately available.
        case raw
        
        /// The results of input are buffered until a newline or carrage return.  This the default terminal mode, sometimes refereed to as 'cooked' mode.
        case noraw
        
        /// Makes keypresses immediately available, except ctrl-c and ctrl-z are passed to the terminal driver allowing for
        case cbreak
        
        /// The results of input are buffered until a newline or carrage return.  This the default terminal mode, sometimes refereed to as 'cooked' mode.
        case nocbreak
        
        /** Makes keyboard presses immediately available and returns an error if no input is provided after a specified `timeout` (in tenths of seconds)
        
            * Use .nocbreak to switch out of halfdelay mode
         */
        case halfdelay(timout: Int)
        
        //Modes to consider adding in the future
        /*
         int intrflush(WINDOW *win, bool bf);
         int meta(WINDOW *win, bool bf);
         int nodelay(WINDOW *win, bool bf);

         void noqiflush(void);
         void qiflush(void);
         int notimeout(WINDOW *win, bool bf);
         void timeout(int delay);
         void wtimeout(WINDOW *win, int delay);
         int typeahead(int fd);

         */
    }
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
    

    
    public private(set) var currentMode: Mode = .raw
    
    public private(set) var echoing: Bool = false
    
    public private(set) var keypadEnabled: Bool = true
    
    public private(set) var standardScreen: UnsafeMutablePointer<WINDOW>!
    
    /// Terminal is a singleton and should be accessed via Terminal.shared
    init(mode: Mode = .raw, echoing: Bool = false, keypadEnabled: Bool = true) {
        // sets the locale and associated available characters based on the calling program
        setlocale(LC_ALL, "")
        ncurses.initscr()

        self.standardScreen = stdscr
        try? self.set(mode: mode)
        self.set(echoing: echoing)
        self.set(keypadEnabled: keypadEnabled)
    }
    
    deinit {
        // release
    }
    
    /// Sets the input mode of the terminal.
    public func set(mode: Mode) throws {
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

