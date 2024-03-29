//
//  File.swift
//
//
//  Created by Jonathan Badger on 12/28/21.
//

import Foundation

import ncurses


//A private class representing the cursor location in a window
///
public struct Cursor {
    public enum Style: Int32 {
        case invisible
        case visible
        case veryVisible

    }

    internal let window: UnsafeMutablePointer<WINDOW>!
    public var location: Location {
        return Location(x: getcurx(window), y: getcury(window))
    }


    internal init(window: UnsafeMutablePointer<WINDOW>) {
        self.window = window
    }

    // int wmove(WINDOW *win, int y, int x);
    public func move(toLocation location: Location) {
        wmove(window, location.y, location.x)
    }

    ///Sets the cursor style
    public func set(style: Style) {
        curs_set(style.rawValue)

    }




}
