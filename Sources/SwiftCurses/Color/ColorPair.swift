//
//  File.swift
//  
//
//  Created by Jonathan Badger on 12/30/21.
//

import Foundation
import ncurses

public struct ColorPair: Equatable {

    
    public let foreground: Color
    public let background: Color
    public let name: String?
    public init(foreground: Color, background: Color, name: String?) {
        self.foreground = foreground
        self.background = background
        self.name = name
    }
    
    public static func == (lhs: ColorPair, rhs: ColorPair) -> Bool {
        lhs.foreground == rhs.foreground &&
        lhs.background == rhs.background
    }
}
