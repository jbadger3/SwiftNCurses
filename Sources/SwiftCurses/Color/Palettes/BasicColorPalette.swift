//
//  File.swift
//  
//
//  Created by Jonathan Badger on 1/3/22.
//

import Foundation

public struct BasicColorPalette: ColorPalette {
    let Black = Color(index: 0, r: 0, g: 0, b: 0)
    let Red = Color(index: 1, r: 680, g: 0, b: 0)
    let Green = Color(index: 2, r: 0, g: 680, b: 0)
    let Yellow = Color(index: 3, r: 680, g: 680, b: 0)
    let Blue = Color(index: 4, r: 0, g: 0, b: 680)
    let Magenta = Color(index: 5, r: 680, g: 0, b: 680)
    let Cyan = Color(index: 6, r: 0, g: 680, b: 680)
    let White = Color(index: 7, r: 680, g: 680, b: 680)
    
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
    public func defaultPair() -> (foreground: Color, background: Color) {
        return (foreground: BasicColorPalette().White, background: BasicColorPalette().Black)
    }
}
