//
//  File.swift
//  
//
//  Created by Jonathan Badger on 12/30/21.
//

import Foundation
import ncurses

public class Colors<Palette: ColorPalette> {
    public let palette: Palette
    
    public static var maxColors: Int {
        return Int(COLORS)
    }
    public static var maxColorPairs: Int {
        return Int(COLOR_PAIRS)
    }
    
    internal init(palette: Palette = X11WebPalette.self as! Palette) {
        self.palette = palette
        if !(palette is BasicColorPalette) {
            initializeColors()
        }
    }
    
    public static func getColor(atIndex index: Int16) -> (r: Int16, g: Int16, b: Int16) {
        var r: Int16 = 0
        var g: Int16 = 0
        var b: Int16 = 0
        color_content(index, &r, &g, &b)
        return (r: r, g: g, b: b)
    }
    
    public static func setColor(index: Int16, r: Int16, g: Int16, b: Int16) {
        init_color(index, r, g, b)
    }
    
    public static func setColorPair(index: Int16, forgroundColor: Int16, backgroundColor: Int16) {
        init_pair(index, forgroundColor, backgroundColor)
        
    }
    
    public static func getColorPair(index: Int32) -> (fgIndex: Int16, bgIndex: Int16) {
        var backgroundColor: Int16 = 0
        var foregroundColor: Int16 = 0
        pair_content(0, &foregroundColor, &backgroundColor)
        return (fgIndex: foregroundColor, bgIndex: backgroundColor)
    }
    
    private func initializeColors() {
        for color in palette.allValues() {
            let colorData = color.indexAndRGBValues()
            init_color(colorData.index, colorData.r, colorData.g, colorData.b)
        }
    }
    
    
    
}




