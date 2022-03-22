//
//  File.swift
//
//
//  Created by Jonathan Badger on 12/28/21.
//

import Foundation

///Specifies a location on a window or screen. where x is the column y is the line number
public struct Location: Equatable {
    public let x: Int32
    public let y: Int32
    public init(x: Int32, y: Int32) {
        self.x = x
        self.y = y
    }
}
