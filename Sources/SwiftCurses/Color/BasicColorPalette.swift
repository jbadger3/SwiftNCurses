//
//  File.swift
//  
//
//  Created by Jonathan Badger on 1/3/22.
//

import Foundation

public enum BasicColorPalette: Int16, CaseIterable, ColorPalette {
    case Black
    case Red
    case Green
    case Yellow
    case Blue
    case Magenta
    case Cyan
    case White
    
    //This should never actually be called...initialized by ncurses library
    public func indexAndRGBValues() -> (index: Int16, r: Int16, g: Int16, b: Int16) {
        return (0, 0,0,0)
    }
    
    public func allValues() -> [BasicColorPalette] {
        return BasicColorPalette.allCases
    }
}
