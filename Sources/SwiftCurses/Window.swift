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
    public var subWindows: [Window]?
    
    //WINDOW *newwin(int nlines, int ncols, int begin_y, int begin_x);
    init?(nLines: Int32, nColumns: Int32, location: Location) {
        if let winP = newwin(nLines, nColumns, location.y, location.x) {
            self.windowP = winP
            self.cursor = Cursor(window:winP)
        } else {
            return nil
        }

        
    }
    private init(subWindowP: UnsafeMutablePointer<WINDOW>) {
        self.windowP = subWindowP
        self.cursor = Cursor(window:subWindowP)
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
    
    
    /* from man curs_window
    // The subwindow functions (subwin, derwin, mvderwin, wsyncup,  wsyncdown,
    wcursyncup,  syncok)  are flaky, incompletely implemented, and not well
    tested.
    */
    
    ///int mvderwin(WINDOW *win, int par_y, int par_x);
    public func move(subWindow: Window, toLocation location: (x: Int32, y: Int32)) throws  { 
        guard let subWindows = subWindows,
              subWindows.contains(where: {$0.id==subWindow.id})
        else {
            return
        }
        mvderwin(subWindow.windowP, location.y, location.x)
 
    }
    
    ///    WINDOW *subwin(WINDOW *orig, int nlines, int ncols,
    ///    int begin_y, int begin_x);
    ///    WINDOW *derwin(WINDOW *orig, int nlines, int ncols,int begin_y, int begin_x);
    ///
    public func newSubwindow(nLines: Int32, nColumns: Int32, location: (x: Int32, y: Int32), relativeToScreen: Bool = true) -> Window? {
        var subWindowP: UnsafeMutablePointer<WINDOW>? = nil
        if relativeToScreen {
            subWindowP = subwin(windowP, nLines, nColumns, location.y, location.x)
        } else {
            subWindowP = derwin(windowP, nLines, nColumns, location.y, location.x)
        }
        guard let subWindowP = subWindowP else {
            return nil
        }
        let subWindow = Window(subWindowP: subWindowP)
        if var subWindows = subWindows {
            subWindows.append(subWindow)
        } else {
            subWindows = [subWindow]
        }
        return subWindow
    }
    
    /*functions
    
    void wsyncup(WINDOW *win);
    int syncok(WINDOW *win, bool bf);
    void wcursyncup(WINDOW *win);
    void wsyncdown(WINDOW *win);
     */
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


