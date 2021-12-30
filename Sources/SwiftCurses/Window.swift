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
    public let id = UUID()
    public private(set) var cursor : Cursor
    
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
    init?(nLines: Int32, nColumns: Int32, location: Location) {
        if let winP = newwin(nLines, nColumns, location.y, location.x) {
            self.windowP = winP
            self.cursor = Cursor(window:winP)
        } else {
            return nil
        }

        
    }

    deinit {
        delwin(windowP)
    }
    //WINDOW *dupwin(WINDOW *win);
    
    /// Moves the window so its upper left corner is at the specified location
    /// int mvwin(WINDOW *win, int y, int x);
    public func move(toLocation location: (x: Int32, y: Int32)) throws {
        //TODO add error handling for offscreen window drawing
        mvwin(windowP, location.y, location.x)
    }
    
    /// Refreshes the observed output on standard screen
    public func refresh() {
        wrefresh(windowP)
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


