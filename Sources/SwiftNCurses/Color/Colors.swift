//  Created by Jonathan Badger on 12/30/21.
//
// The number of color pairs is limited to 256 when using the class

import Foundation

import ncurses

/**

 The `index` for a color should correspond to the color scheme used by the terminal
 */
public class Colors {
    public static let shared = Colors()
    public var hasColors: Bool {
        return has_colors()
    }
    public var canChangeColors: Bool {
        return can_change_color()
    }
    public internal(set) var palette: ColorPalette? = nil {
        didSet {
            if canChangeColors {
                initializeColors()
                initializeDefaultColorPair()
            }
        }
    }
    var colorPairs: [ColorPair] = []

    public static var maxColors: Int {
        return Int(COLORS)
    }
    public static var maxColorPairs: Int {
        return Int(COLOR_PAIRS)
    }

    internal init() {}

    private func initializeColors() {
        guard let palette = palette else {
            return
        }
        for color in palette.allColors() {
            init_color(color.index, color.r, color.g, color.b)
        }
    }

    private func initializeDefaultColorPair() {
        guard let palette = palette else {
            return
        }
        let colorPair = palette.defaultPair()
        setColorPair(colorPair: colorPair)
        assume_default_colors(Int32(colorPair.foreground.index), Int32(colorPair.background.index))
    }

    private func setColorPair(colorPair: ColorPair) {
        if !colorPairs.contains(colorPair) && colorPairs.count < Colors.maxColorPairs {
            colorPairs.append(colorPair)
            init_pair(Int16(colorPairs.count - 1), colorPair.foreground.index, colorPair.background.index)
        }
    }

    internal func indexFor(colorPair: ColorPair) -> Int32 {
        guard canChangeColors else { return 0 }
        if let index = colorPairs.firstIndex(of: colorPair) {
            return Int32(index)
        } else {
            setColorPair(colorPair: colorPair)
            return Int32(colorPairs.count - 1)
        }
    }
}
