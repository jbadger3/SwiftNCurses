//
//  Created by Jonathan Badger on 1/4/22.
//

import Foundation

/**
 Colors in ncurses are represented in RGB space using 16 bit integers in the range of 0 - 1000 (as opposed 0 - 255 which is more common).
 */
public struct Color: Equatable, Hashable {
    ///Used by ncurses to set underlying color definition of the terminal
    public let index: Int16
    ///Red intensity  0...1000
    public let r: Int16
    ///Green intensity 0...1000
    public let g: Int16
    ///Blue Intensity 0...1000
    public let b: Int16

    public init(index: Int16, r: Int16, g: Int16, b: Int16) {
        self.index = index
        self.r = r
        self.g = g
        self.b = b
    }
}
