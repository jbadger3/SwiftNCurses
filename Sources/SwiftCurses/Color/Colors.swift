//
//  File.swift
//  
//
//  Created by Jonathan Badger on 12/30/21.
//

import Foundation
import ncurses

public class Colors {
    public let palette: ColorPalette
    private var colorPairs: [ColorPair] = []
    
    public static var maxColors: Int {
        return Int(COLORS)
    }
    public static var maxColorPairs: Int {
        return Int(COLOR_PAIRS)
    }
    
    internal init(palette: ColorPalette) {
        self.palette = palette
        initializeColors()
        initializeDefaultColorPair()
    }
    
    public static func getColor(atIndex index: Int16) -> (r: Int16, g: Int16, b: Int16) {
        var r: Int16 = 0
        var g: Int16 = 0
        var b: Int16 = 0
        color_content(index, &r, &g, &b)
        return (r: r, g: g, b: b)
    }
    
    internal static func setColor(index: Int16, r: Int16, g: Int16, b: Int16) {
        init_color(index, r, g, b)
    }
    
    private static func setColorPair(index: Int16, forgroundColor: Int16, backgroundColor: Int16) {
        init_pair(index, forgroundColor, backgroundColor)
        
    }
    
    public static func getColorPair(index: Int32) -> (fgIndex: Int16, bgIndex: Int16) {
        var backgroundColor: Int16 = 0
        var foregroundColor: Int16 = 0
        pair_content(0, &foregroundColor, &backgroundColor)
        return (fgIndex: foregroundColor, bgIndex: backgroundColor)
    }
    
    private func initializeColors() {
        for color in palette.allColors() {
            init_color(color.index, color.r, color.g, color.b)
        }
    }
    
    private func initializeDefaultColorPair() {
        let pair = palette.defaultPair()
        init_pair(0, pair.foreground.index, pair.background.index)
        assume_default_colors(Int32(pair.foreground.index), Int32(pair.background.index))
    }
    
    
    
}




