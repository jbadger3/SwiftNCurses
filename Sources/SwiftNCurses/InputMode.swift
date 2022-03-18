//
//  File.swift
//  
//
//  Created by Jonathan Badger on 12/29/21.
//

import Foundation

/**
 Terminal input modes
 */
public enum InputMode {
    /// Makes all keypresses immediately available.
    case raw
    
    /// The results of input are buffered until a newline or carrage return.  This the default terminal mode, sometimes refereed to as 'cooked' mode.
    case noraw
    
    /// Makes keypresses immediately available, except ctrl-c and ctrl-z are passed to the terminal driver for program control
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
