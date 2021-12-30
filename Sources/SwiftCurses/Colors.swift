//
//  File.swift
//  
//
//  Created by Jonathan Badger on 12/30/21.
//

import Foundation
import ncurses

public class Colors {
    public static var maxColors: Int {
        return Int(COLORS)
    }
    public static var maxColorPairs: Int {
        return Int(COLOR_PAIRS)
    }
    
    
    public static func getColor(atIndex index: Int16) -> (r: Int16, g: Int16, b: Int16) {
        var r: Int16 = 0
        var g: Int16 = 0
        var b: Int16 = 0
        color_content(index, &r, &g, &b)
        return (r: r, g: g, b: b)
    }
}
