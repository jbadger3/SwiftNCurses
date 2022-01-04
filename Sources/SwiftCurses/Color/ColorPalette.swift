//
//  File.swift
//  
//
//  Created by Jonathan Badger on 1/3/22.
//

import Foundation

public protocol ColorPalette {
    func allColors() -> [Color]
    func defaultPair() -> ColorPair
}
