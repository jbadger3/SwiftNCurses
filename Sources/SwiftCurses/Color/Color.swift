//
//  File.swift
//  
//
//  Created by Jonathan Badger on 1/4/22.
//

import Foundation

public struct Color: Equatable {
    public let index: Int16
    public let r: Int16
    public let g: Int16
    public let b: Int16
    public init(index: Int16, r: Int16, g: Int16, b: Int16) {
        self.index = index
        self.r = r
        self.g = g
        self.b = b
    }
}
