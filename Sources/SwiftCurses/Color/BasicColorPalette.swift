//
//  File.swift
//  
//
//  Created by Jonathan Badger on 1/3/22.
//

import Foundation

public struct BasicColorPalette {
    let Black = Color(index: 0, r: 0, g: 0, b: 0)
    //case Red
    //case Green
    //case Yellow
    //case Blue
    //case Magenta
    //case Cyan
    //case White
    
    //This should never actually be called...initialized by ncurses library
    public init() {}

    public func allColors() -> [Color]  {
        var colors: [Color] = []
        let mirror = Mirror(reflecting: self)
        for child in mirror.children {
            if let color = child.value as? Color {
                colors.append(color)
            }
        }
        return colors
    }
}
