import Foundation
import ncurses

public enum X11WebPalette: Int16, CaseIterable, ColorPalette {
    case MediumVioletRed
    case DeepPink
    case PaleVioletRed
    case HotPink
    case LightPink
    case Pink
    case DarkRed
    case Red
    case Firebrick
    case Crimson
    case IndianRed
    case LightCoral
    case Salmon
    case DarkSalmon
    case LightSalmon
    case OrangeRed
    case Tomato
    case DarkOrange
    case Coral
    case Orange
    case DarkKhaki
    case Gold
    case Khaki
    case PeachPuff
    case Yellow
    case PaleGoldenrod
    case Moccasin
    case PapayaWhip
    case LightGoldenrodYellow
    case LemonChiffon
    case LightYellow
    case Maroon
    case Brown
    case SaddleBrown
    case Sienna
    case Chocolate
    case DarkGoldenrod
    case Peru
    case RosyBrown
    case Goldenrod
    case SandyBrown
    case Tan
    case Burlywood
    case Wheat
    case NavajoWhite
    case Bisque
    case BlanchedAlmond
    case Cornsilk
    case DarkGreen
    case Green
    case DarkOliveGreen
    case ForestGreen
    case SeaGreen
    case Olive
    case OliveDrab
    case MediumSeaGreen
    case LimeGreen
    case Lime
    case SpringGreen
    case MediumSpringGreen
    case DarkSeaGreen
    case MediumAquamarine
    case YellowGreen
    case LawnGreen
    case Chartreuse
    case LightGreen
    case GreenYellow
    case PaleGreen
    case Teal
    case DarkCyan
    case LightSeaGreen
    case CadetBlue
    case DarkTurquoise
    case MediumTurquoise
    case Turquoise
    case Aqua
    case Cyan
    case Aquamarine
    case PaleTurquoise
    case LightCyan
    case Navy
    case DarkBlue
    case MediumBlue
    case Blue
    case MidnightBlue
    case RoyalBlue
    case SteelBlue
    case DodgerBlue
    case DeepSkyBlue
    case CornflowerBlue
    case SkyBlue
    case LightSkyBlue
    case LightSteelBlue
    case LightBlue
    case PowderBlue
    case ndigo
    case Purple
    case DarkMagenta
    case DarkViolet
    case DarkSlateBlue
    case BlueViolet
    case DarkOrchid
    case Fuchsia
    case Magenta
    case SlateBlue
    case MediumSlateBlue
    case MediumOrchid
    case MediumPurple
    case Orchid
    case Violet
    case Plum
    case Thistle
    case Lavender
    case MistyRose
    case AntiqueWhite
    case Linen
    case Beige
    case WhiteSmoke
    case LavenderBlush
    case OldLace
    case AliceBlue
    case Seashell
    case GhostWhite
    case Honeydew
    case FloralWhite
    case Azure
    case MintCream
    case Snow
    case Ivory
    case White
    case Black
    case DarkSlateGray
    case DimGray
    case SlateGray
    case Gray
    case LightSlateGray
    case DarkGray
    case Silver
    case LightGray
    case Gainsboro
    
    public func allValues() -> [X11WebPalette] {
        return X11WebPalette.allCases
    }

    public func indexAndRGBValues() -> (index: Int16, r: Int16, g: Int16, b: Int16) {
        switch self {
        case .MediumVioletRed:
            return (index:0, r:780, g:82, b:522)
        case .DeepPink:
            return (index:1, r:1000, g:78, b:576)
        case .PaleVioletRed:
            return (index:2, r:859, g:439, b:576)
        case .HotPink:
            return (index:3, r:1000, g:412, b:706)
        case .LightPink:
            return (index:4, r:1000, g:714, b:757)
        case .Pink:
            return (index:5, r:1000, g:753, b:796)
        case .DarkRed:
            return (index:6, r:545, g:0, b:0)
        case .Red:
            return (index:7, r:1000, g:0, b:0)
        case .Firebrick:
            return (index:8, r:698, g:133, b:133)
        case .Crimson:
            return (index:9, r:863, g:78, b:235)
        case .IndianRed:
            return (index:10, r:804, g:361, b:361)
        case .LightCoral:
            return (index:11, r:941, g:502, b:502)
        case .Salmon:
            return (index:12, r:980, g:502, b:447)
        case .DarkSalmon:
            return (index:13, r:914, g:588, b:478)
        case .LightSalmon:
            return (index:14, r:1000, g:627, b:478)
        case .OrangeRed:
            return (index:15, r:1000, g:271, b:0)
        case .Tomato:
            return (index:16, r:1000, g:388, b:278)
        case .DarkOrange:
            return (index:17, r:1000, g:549, b:0)
        case .Coral:
            return (index:18, r:1000, g:498, b:314)
        case .Orange:
            return (index:19, r:1000, g:647, b:0)
        case .DarkKhaki:
            return (index:20, r:741, g:718, b:420)
        case .Gold:
            return (index:21, r:1000, g:843, b:0)
        case .Khaki:
            return (index:22, r:941, g:902, b:549)
        case .PeachPuff:
            return (index:23, r:1000, g:855, b:725)
        case .Yellow:
            return (index:24, r:1000, g:1000, b:0)
        case .PaleGoldenrod:
            return (index:25, r:933, g:910, b:667)
        case .Moccasin:
            return (index:26, r:1000, g:894, b:710)
        case .PapayaWhip:
            return (index:27, r:1000, g:937, b:835)
        case .LightGoldenrodYellow:
            return (index:28, r:980, g:980, b:824)
        case .LemonChiffon:
            return (index:29, r:1000, g:980, b:804)
        case .LightYellow:
            return (index:30, r:1000, g:1000, b:878)
        case .Maroon:
            return (index:31, r:502, g:0, b:0)
        case .Brown:
            return (index:32, r:647, g:165, b:165)
        case .SaddleBrown:
            return (index:33, r:545, g:271, b:75)
        case .Sienna:
            return (index:34, r:627, g:322, b:176)
        case .Chocolate:
            return (index:35, r:824, g:412, b:118)
        case .DarkGoldenrod:
            return (index:36, r:722, g:525, b:43)
        case .Peru:
            return (index:37, r:804, g:522, b:247)
        case .RosyBrown:
            return (index:38, r:737, g:561, b:561)
        case .Goldenrod:
            return (index:39, r:855, g:647, b:125)
        case .SandyBrown:
            return (index:40, r:957, g:643, b:376)
        case .Tan:
            return (index:41, r:824, g:706, b:549)
        case .Burlywood:
            return (index:42, r:871, g:722, b:529)
        case .Wheat:
            return (index:43, r:961, g:871, b:702)
        case .NavajoWhite:
            return (index:44, r:1000, g:871, b:678)
        case .Bisque:
            return (index:45, r:1000, g:894, b:769)
        case .BlanchedAlmond:
            return (index:46, r:1000, g:922, b:804)
        case .Cornsilk:
            return (index:47, r:1000, g:973, b:863)
        case .DarkGreen:
            return (index:48, r:0, g:392, b:0)
        case .Green:
            return (index:49, r:0, g:502, b:0)
        case .DarkOliveGreen:
            return (index:50, r:333, g:420, b:184)
        case .ForestGreen:
            return (index:51, r:133, g:545, b:133)
        case .SeaGreen:
            return (index:52, r:180, g:545, b:341)
        case .Olive:
            return (index:53, r:502, g:502, b:0)
        case .OliveDrab:
            return (index:54, r:420, g:557, b:137)
        case .MediumSeaGreen:
            return (index:55, r:235, g:702, b:443)
        case .LimeGreen:
            return (index:56, r:196, g:804, b:196)
        case .Lime:
            return (index:57, r:0, g:1000, b:0)
        case .SpringGreen:
            return (index:58, r:0, g:1000, b:498)
        case .MediumSpringGreen:
            return (index:59, r:0, g:980, b:604)
        case .DarkSeaGreen:
            return (index:60, r:561, g:737, b:561)
        case .MediumAquamarine:
            return (index:61, r:400, g:804, b:667)
        case .YellowGreen:
            return (index:62, r:604, g:804, b:196)
        case .LawnGreen:
            return (index:63, r:486, g:988, b:0)
        case .Chartreuse:
            return (index:64, r:498, g:1000, b:0)
        case .LightGreen:
            return (index:65, r:565, g:933, b:565)
        case .GreenYellow:
            return (index:66, r:678, g:1000, b:184)
        case .PaleGreen:
            return (index:67, r:596, g:984, b:596)
        case .Teal:
            return (index:68, r:0, g:502, b:502)
        case .DarkCyan:
            return (index:69, r:0, g:545, b:545)
        case .LightSeaGreen:
            return (index:70, r:125, g:698, b:667)
        case .CadetBlue:
            return (index:71, r:373, g:620, b:627)
        case .DarkTurquoise:
            return (index:72, r:0, g:808, b:820)
        case .MediumTurquoise:
            return (index:73, r:282, g:820, b:800)
        case .Turquoise:
            return (index:74, r:251, g:878, b:816)
        case .Aqua:
            return (index:75, r:0, g:1000, b:1000)
        case .Cyan:
            return (index:76, r:0, g:1000, b:1000)
        case .Aquamarine:
            return (index:77, r:498, g:1000, b:831)
        case .PaleTurquoise:
            return (index:78, r:686, g:933, b:933)
        case .LightCyan:
            return (index:79, r:878, g:1000, b:1000)
        case .Navy:
            return (index:80, r:0, g:0, b:502)
        case .DarkBlue:
            return (index:81, r:0, g:0, b:545)
        case .MediumBlue:
            return (index:82, r:0, g:0, b:804)
        case .Blue:
            return (index:83, r:0, g:0, b:1000)
        case .MidnightBlue:
            return (index:84, r:98, g:98, b:439)
        case .RoyalBlue:
            return (index:85, r:255, g:412, b:882)
        case .SteelBlue:
            return (index:86, r:275, g:510, b:706)
        case .DodgerBlue:
            return (index:87, r:118, g:565, b:1000)
        case .DeepSkyBlue:
            return (index:88, r:0, g:749, b:1000)
        case .CornflowerBlue:
            return (index:89, r:392, g:584, b:929)
        case .SkyBlue:
            return (index:90, r:529, g:808, b:922)
        case .LightSkyBlue:
            return (index:91, r:529, g:808, b:980)
        case .LightSteelBlue:
            return (index:92, r:690, g:769, b:871)
        case .LightBlue:
            return (index:93, r:678, g:847, b:902)
        case .PowderBlue:
            return (index:94, r:690, g:878, b:902)
        case .ndigo:
            return (index:95, r:294, g:0, b:510)
        case .Purple:
            return (index:96, r:502, g:0, b:502)
        case .DarkMagenta:
            return (index:97, r:545, g:0, b:545)
        case .DarkViolet:
            return (index:98, r:580, g:0, b:827)
        case .DarkSlateBlue:
            return (index:99, r:282, g:239, b:545)
        case .BlueViolet:
            return (index:100, r:541, g:169, b:886)
        case .DarkOrchid:
            return (index:101, r:600, g:196, b:800)
        case .Fuchsia:
            return (index:102, r:1000, g:0, b:1000)
        case .Magenta:
            return (index:103, r:1000, g:0, b:1000)
        case .SlateBlue:
            return (index:104, r:416, g:353, b:804)
        case .MediumSlateBlue:
            return (index:105, r:482, g:408, b:933)
        case .MediumOrchid:
            return (index:106, r:729, g:333, b:827)
        case .MediumPurple:
            return (index:107, r:576, g:439, b:859)
        case .Orchid:
            return (index:108, r:855, g:439, b:839)
        case .Violet:
            return (index:109, r:933, g:510, b:933)
        case .Plum:
            return (index:110, r:867, g:627, b:867)
        case .Thistle:
            return (index:111, r:847, g:749, b:847)
        case .Lavender:
            return (index:112, r:902, g:902, b:980)
        case .MistyRose:
            return (index:113, r:1000, g:894, b:882)
        case .AntiqueWhite:
            return (index:114, r:980, g:922, b:843)
        case .Linen:
            return (index:115, r:980, g:941, b:902)
        case .Beige:
            return (index:116, r:961, g:961, b:863)
        case .WhiteSmoke:
            return (index:117, r:961, g:961, b:961)
        case .LavenderBlush:
            return (index:118, r:1000, g:941, b:961)
        case .OldLace:
            return (index:119, r:992, g:961, b:902)
        case .AliceBlue:
            return (index:120, r:941, g:973, b:1000)
        case .Seashell:
            return (index:121, r:1000, g:961, b:933)
        case .GhostWhite:
            return (index:122, r:973, g:973, b:1000)
        case .Honeydew:
            return (index:123, r:941, g:1000, b:941)
        case .FloralWhite:
            return (index:124, r:1000, g:980, b:941)
        case .Azure:
            return (index:125, r:941, g:1000, b:1000)
        case .MintCream:
            return (index:126, r:961, g:1000, b:980)
        case .Snow:
            return (index:127, r:1000, g:980, b:980)
        case .Ivory:
            return (index:128, r:1000, g:1000, b:941)
        case .White:
            return (index:129, r:1000, g:1000, b:1000)
        case .Black:
            return (index:130, r:0, g:0, b:0)
        case .DarkSlateGray:
            return (index:131, r:184, g:310, b:310)
        case .DimGray:
            return (index:132, r:412, g:412, b:412)
        case .SlateGray:
            return (index:133, r:439, g:502, b:565)
        case .Gray:
            return (index:134, r:502, g:502, b:502)
        case .LightSlateGray:
            return (index:135, r:467, g:533, b:600)
        case .DarkGray:
            return (index:136, r:663, g:663, b:663)
        case .Silver:
            return (index:137, r:753, g:753, b:753)
        case .LightGray:
            return (index:138, r:827, g:827, b:827)
        case .Gainsboro:
            return (index:139, r:863, g:863, b:863)
        }
    }
}
