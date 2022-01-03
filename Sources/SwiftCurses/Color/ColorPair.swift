//
//  File.swift
//  
//
//  Created by Jonathan Badger on 12/30/21.
//

import Foundation
import ncurses

public struct ColorPair {
    public var name: String
    public var index: Int32
    public init(name: String, index: Int32) {
        self.name = name
        self.index = index
    }
}
