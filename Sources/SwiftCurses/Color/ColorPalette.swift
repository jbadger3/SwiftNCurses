//
//  File.swift
//  
//
//  Created by Jonathan Badger on 1/3/22.
//

import Foundation

public protocol ColorPalette {
    func indexAndRGBValues() -> (index: Int16, r: Int16, g: Int16, b: Int16)
    func allValues() -> [Self]
}
