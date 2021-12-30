//
//  File.swift
//  
//
//  Created by Jonathan Badger on 12/29/21.
//

import Foundation

public struct Attributes: OptionSet {
    public var rawValue: UInt32
    
    //#define A_NORMAL    (1U - 1U)
    public static let normal = Attributes(rawValue: 0)
    //#define A_STANDOUT    NCURSES_BITS(1U,8)
    public static let standOut = Attributes(rawValue: 1 << (8 + 8))
    //#define A_UNDERLINE    NCURSES_BITS(1U,9)
    public static let underline = Attributes(rawValue: 1 << (8 + 9))
    //#define A_REVERSE    NCURSES_BITS(1U,10)
    public static let reverse = Attributes(rawValue: 1 << (8 + 10))
    //#define A_BLINK        NCURSES_BITS(1U,11)
    public static let blink = Attributes(rawValue: 1 << (8 + 11))
    //#define A_DIM        NCURSES_BITS(1U,12)
    public static let dim = Attributes(rawValue: 1 << (8 + 12))
    //#define A_BOLD        NCURSES_BITS(1U,13)
    public static let bold = Attributes(rawValue: 1 << (8 + 13))
    //#define A_PROTECT    NCURSES_BITS(1U,16)
    public static let protected = Attributes(rawValue: 1 << (8 + 16))
    //#define A_INVIS        NCURSES_BITS(1U,15)
    public static let invisible = Attributes(rawValue: 1 << (8 + 15))
    //#define A_ALTCHARSET    NCURSES_BITS(1U,14)
    public static let altCharSet = Attributes(rawValue: 1 << (8 + 14))
    //#define A_CHARTEXT    (NCURSES_BITS(1U,0) - 1U)
    //need to check this
    //static let charText = Attributes(rawValue: 1 << 8 - 1)
    
    
    /*
                   A_NORMAL        Normal display (no highlight)
                   A_STANDOUT      Best highlighting mode of the terminal.
                   A_UNDERLINE     Underlining
                   A_REVERSE       Reverse video
                   A_BLINK         Blinking
                   A_DIM           Half bright
                   A_BOLD          Extra bright or bold
                   A_PROTECT       Protected mode
                   A_INVIS         Invisible or blank mode
                   A_ALTCHARSET    Alternate character set
                   A_CHARTEXT      Bit-mask to extract a character
                   COLOR_PAIR(n)   Color-pair number n
     */
    
   /*
    #define NCURSES_ATTR_SHIFT       8
    #define NCURSES_BITS(mask,shift) (NCURSES_CAST(chtype,(mask)) << ((shift) + NCURSES_ATTR_SHIFT))
    #define A_STANDOUT    NCURSES_BITS(1U,8)
    #define A_NORMAL    (1U - 1U)
    #define A_ATTRIBUTES    NCURSES_BITS(~(1U - 1U),0)
    #define A_CHARTEXT    (NCURSES_BITS(1U,0) - 1U)
    #define A_COLOR        NCURSES_BITS(((1U) << 8) - 1U,0)
    #define A_STANDOUT    NCURSES_BITS(1U,8)
    #define A_UNDERLINE    NCURSES_BITS(1U,9)
    #define A_REVERSE    NCURSES_BITS(1U,10)
    #define A_BLINK        NCURSES_BITS(1U,11)
    #define A_DIM        NCURSES_BITS(1U,12)
    #define A_BOLD        NCURSES_BITS(1U,13)
    #define A_ALTCHARSET    NCURSES_BITS(1U,14)
    #define A_INVIS        NCURSES_BITS(1U,15)
    #define A_PROTECT    NCURSES_BITS(1U,16)
    #define A_HORIZONTAL    NCURSES_BITS(1U,17)
    #define A_LEFT        NCURSES_BITS(1U,18)
    #define A_LOW        NCURSES_BITS(1U,19)
    #define A_RIGHT        NCURSES_BITS(1U,20)
    #define A_TOP        NCURSES_BITS(1U,21)
    #define A_VERTICAL    NCURSES_BITS(1U,22)

    #if 1
    #define A_ITALIC    NCURSES_BITS(1U,23)    /* ncurses extension */
    #endif
    */
    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }

}
