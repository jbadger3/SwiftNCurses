//
//  File.swift
//  
//
//  Created by Jonathan Badger on 1/5/22.
//

import Foundation
import ncurses


public struct Key {
    public enum KeyType {
        case controlKey
        case specialKey
        case characterKey
    }
    
    let rawValue: Int32
    public init(rawValue: Int32) {
        
        self.rawValue = rawValue
    }
    
}
