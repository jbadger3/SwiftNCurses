//  Created by Jonathan Badger on 1/3/22.
//

import Foundation

/**
 The BasicColorPalette contains the 8 colors originally specified in ncurses.  Users interested in 256 colors should use the ``X11WebPalette`` or ``XTermPalette``.
 */
public struct BasicColorPalette: ColorPalette {
    public let Black = Color(index: 0, r: 0, g: 0, b: 0)
    public let Red = Color(index: 1, r: 680, g: 0, b: 0)
    public let Green = Color(index: 2, r: 0, g: 680, b: 0)
    public let Yellow = Color(index: 3, r: 680, g: 680, b: 0)
    public let Blue = Color(index: 4, r: 0, g: 0, b: 680)
    public let Magenta = Color(index: 5, r: 680, g: 0, b: 680)
    public let Cyan = Color(index: 6, r: 0, g: 680, b: 680)
    public let White = Color(index: 7, r: 680, g: 680, b: 680)
    
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
    ///White text on a black background
    public func defaultPair() -> ColorPair {
        return ColorPair(foreground: BasicColorPalette().White, background: BasicColorPalette().Black)
    }
}
