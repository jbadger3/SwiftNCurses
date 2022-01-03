import Foundation
import ncurses

public enum XTermColor: Int16, CaseIterable {
    case Black
    case Maroon
    case Green5
    case Olive
    case Navy
    case Purple5
    case Teal
    case Silver
    case Grey
    case Red4
    case Lime
    case Yellow7
    case Blue4
    case Fuchsia
    case Aqua
    case White
    case Grey0
    case NavyBlue
    case DarkBlue
    case Blue3
    case Blue2
    case Blue1
    case DarkGreen
    case DeepSkyBlue7
    case DeepSkyBlue6
    case DeepSkyBlue5
    case DodgerBlue3
    case DodgerBlue2
    case Green4
    case SpringGreen6
    case Turquoise3
    case DeepSkyBlue4
    case DeepSkyBlue3
    case DodgerBlue1
    case Green3
    case SpringGreen5
    case DarkCyan
    case LightSeaGreen
    case DeepSkyBlue2
    case DeepSkyBlue1
    case Green2
    case SpringGreen4
    case SpringGreen3
    case Cyan3
    case DarkTurquoise
    case Turquoise2
    case Green1
    case SpringGreen2
    case SpringGreen1
    case MediumSpringGreen
    case Cyan2
    case Cyan1
    case DarkRed1
    case DeepPink8
    case Purple4
    case Purple3
    case Purple2
    case BlueViolet
    case Orange4
    case Grey37
    case MediumPurple7
    case SlateBlue3
    case SlateBlue2
    case RoyalBlue1
    case Chartreuse6
    case DarkSeaGreen9
    case PaleTurquoise2
    case SteelBlue4
    case SteelBlue3
    case CornflowerBlue
    case Chartreuse5
    case DarkSeaGreen8
    case CadetBlue1
    case CadetBlue
    case SkyBlue3
    case SteelBlue2
    case Chartreuse4
    case PaleGreen4
    case SeaGreen4
    case Aquamarine3
    case MediumTurquoise
    case SteelBlue1
    case Chartreuse3
    case SeaGreen3
    case SeaGreen2
    case SeaGreen1
    case Aquamarine2
    case DarkSlateGray3
    case DarkRed
    case DeepPink7
    case DarkMagenta1
    case DarkMagenta
    case DarkViolet1
    case Purple1
    case Orange3
    case LightPink3
    case Plum4
    case MediumPurple6
    case MediumPurple5
    case SlateBlue1
    case Yellow6
    case Wheat2
    case Grey53
    case LightSlateGrey
    case MediumPurple4
    case LightSlateBlue
    case Yellow5
    case DarkOliveGreen6
    case DarkSeaGreen7
    case LightSkyBlue3
    case LightSkyBlue2
    case SkyBlue2
    case Chartreuse2
    case DarkOliveGreen5
    case PaleGreen3
    case DarkSeaGreen6
    case DarkSlateGray2
    case SkyBlue1
    case Chartreuse1
    case LightGreen1
    case LightGreen
    case PaleGreen2
    case Aquamarine1
    case DarkSlateGray1
    case Red3
    case DeepPink6
    case MediumVioletRed
    case Magenta6
    case DarkViolet
    case Purple
    case DarkOrange2
    case IndianRed4
    case HotPink4
    case MediumOrchid4
    case MediumOrchid3
    case MediumPurple3
    case DarkGoldenrod
    case LightSalmon3
    case RosyBrown
    case Grey63
    case MediumPurple2
    case MediumPurple1
    case Gold3
    case DarkKhaki
    case NavajoWhite2
    case Grey69
    case LightSteelBlue3
    case LightSteelBlue2
    case Yellow4
    case DarkOliveGreen4
    case DarkSeaGreen5
    case DarkSeaGreen4
    case LightCyan2
    case LightSkyBlue1
    case GreenYellow
    case DarkOliveGreen3
    case PaleGreen1
    case DarkSeaGreen3
    case DarkSeaGreen2
    case PaleTurquoise1
    case Red2
    case DeepPink5
    case DeepPink4
    case Magenta5
    case Magenta4
    case Magenta3
    case DarkOrange1
    case IndianRed3
    case HotPink3
    case HotPink2
    case Orchid3
    case MediumOrchid2
    case Orange2
    case LightSalmon2
    case LightPink2
    case Pink2
    case Plum3
    case Violet
    case Gold2
    case LightGoldenrod5
    case Tan
    case MistyRose2
    case Thistle2
    case Plum2
    case Yellow3
    case Khaki2
    case LightGoldenrod4
    case LightYellow3
    case Grey84
    case LightSteelBlue1
    case Yellow2
    case DarkOliveGreen2
    case DarkOliveGreen1
    case DarkSeaGreen1
    case Honeydew2
    case LightCyan1
    case Red1
    case DeepPink3
    case DeepPink2
    case DeepPink1
    case Magenta2
    case Magenta1
    case OrangeRed1
    case IndianRed2
    case IndianRed1
    case HotPink1
    case HotPink
    case MediumOrchid1
    case DarkOrange
    case Salmon1
    case LightCoral
    case PaleVioletRed1
    case Orchid2
    case Orchid1
    case Orange1
    case SandyBrown
    case LightSalmon1
    case LightPink1
    case Pink1
    case Plum1
    case Gold1
    case LightGoldenrod3
    case LightGoldenrod2
    case NavajoWhite1
    case MistyRose1
    case Thistle1
    case Yellow1
    case LightGoldenrod1
    case Khaki1
    case Wheat1
    case Cornsilk1
    case Grey100
    case Grey3
    case Grey7
    case Grey11
    case Grey15
    case Grey19
    case Grey23
    case Grey27
    case Grey30
    case Grey35
    case Grey39
    case Grey42
    case Grey46
    case Grey50
    case Grey54
    case Grey58
    case Grey62
    case Grey66
    case Grey70
    case Grey74
    case Grey78
    case Grey82
    case Grey85
    case Grey89
    case Grey93

    func indexAndRGBValues() -> (index: Int16, r: Int16, g: Int16, b: Int16) {
        switch self {
        case .Black:
            return (index:0, r:0, g:0, b:0)
        case .Maroon:
            return (index:1, r:502, g:0, b:0)
        case .Green5:
            return (index:2, r:0, g:502, b:0)
        case .Olive:
            return (index:3, r:502, g:502, b:0)
        case .Navy:
            return (index:4, r:0, g:0, b:502)
        case .Purple5:
            return (index:5, r:502, g:0, b:502)
        case .Teal:
            return (index:6, r:0, g:502, b:502)
        case .Silver:
            return (index:7, r:753, g:753, b:753)
        case .Grey:
            return (index:8, r:502, g:502, b:502)
        case .Red4:
            return (index:9, r:1000, g:0, b:0)
        case .Lime:
            return (index:10, r:0, g:1000, b:0)
        case .Yellow7:
            return (index:11, r:1000, g:1000, b:0)
        case .Blue4:
            return (index:12, r:0, g:0, b:1000)
        case .Fuchsia:
            return (index:13, r:1000, g:0, b:1000)
        case .Aqua:
            return (index:14, r:0, g:1000, b:1000)
        case .White:
            return (index:15, r:1000, g:1000, b:1000)
        case .Grey0:
            return (index:16, r:0, g:0, b:0)
        case .NavyBlue:
            return (index:17, r:0, g:0, b:373)
        case .DarkBlue:
            return (index:18, r:0, g:0, b:529)
        case .Blue3:
            return (index:19, r:0, g:0, b:686)
        case .Blue2:
            return (index:20, r:0, g:0, b:843)
        case .Blue1:
            return (index:21, r:0, g:0, b:1000)
        case .DarkGreen:
            return (index:22, r:0, g:373, b:0)
        case .DeepSkyBlue7:
            return (index:23, r:0, g:373, b:373)
        case .DeepSkyBlue6:
            return (index:24, r:0, g:373, b:529)
        case .DeepSkyBlue5:
            return (index:25, r:0, g:373, b:686)
        case .DodgerBlue3:
            return (index:26, r:0, g:373, b:843)
        case .DodgerBlue2:
            return (index:27, r:0, g:373, b:1000)
        case .Green4:
            return (index:28, r:0, g:529, b:0)
        case .SpringGreen6:
            return (index:29, r:0, g:529, b:373)
        case .Turquoise3:
            return (index:30, r:0, g:529, b:529)
        case .DeepSkyBlue4:
            return (index:31, r:0, g:529, b:686)
        case .DeepSkyBlue3:
            return (index:32, r:0, g:529, b:843)
        case .DodgerBlue1:
            return (index:33, r:0, g:529, b:1000)
        case .Green3:
            return (index:34, r:0, g:686, b:0)
        case .SpringGreen5:
            return (index:35, r:0, g:686, b:373)
        case .DarkCyan:
            return (index:36, r:0, g:686, b:529)
        case .LightSeaGreen:
            return (index:37, r:0, g:686, b:686)
        case .DeepSkyBlue2:
            return (index:38, r:0, g:686, b:843)
        case .DeepSkyBlue1:
            return (index:39, r:0, g:686, b:1000)
        case .Green2:
            return (index:40, r:0, g:843, b:0)
        case .SpringGreen4:
            return (index:41, r:0, g:843, b:373)
        case .SpringGreen3:
            return (index:42, r:0, g:843, b:529)
        case .Cyan3:
            return (index:43, r:0, g:843, b:686)
        case .DarkTurquoise:
            return (index:44, r:0, g:843, b:843)
        case .Turquoise2:
            return (index:45, r:0, g:843, b:1000)
        case .Green1:
            return (index:46, r:0, g:1000, b:0)
        case .SpringGreen2:
            return (index:47, r:0, g:1000, b:373)
        case .SpringGreen1:
            return (index:48, r:0, g:1000, b:529)
        case .MediumSpringGreen:
            return (index:49, r:0, g:1000, b:686)
        case .Cyan2:
            return (index:50, r:0, g:1000, b:843)
        case .Cyan1:
            return (index:51, r:0, g:1000, b:1000)
        case .DarkRed1:
            return (index:52, r:373, g:0, b:0)
        case .DeepPink8:
            return (index:53, r:373, g:0, b:373)
        case .Purple4:
            return (index:54, r:373, g:0, b:529)
        case .Purple3:
            return (index:55, r:373, g:0, b:686)
        case .Purple2:
            return (index:56, r:373, g:0, b:843)
        case .BlueViolet:
            return (index:57, r:373, g:0, b:1000)
        case .Orange4:
            return (index:58, r:373, g:373, b:0)
        case .Grey37:
            return (index:59, r:373, g:373, b:373)
        case .MediumPurple7:
            return (index:60, r:373, g:373, b:529)
        case .SlateBlue3:
            return (index:61, r:373, g:373, b:686)
        case .SlateBlue2:
            return (index:62, r:373, g:373, b:843)
        case .RoyalBlue1:
            return (index:63, r:373, g:373, b:1000)
        case .Chartreuse6:
            return (index:64, r:373, g:529, b:0)
        case .DarkSeaGreen9:
            return (index:65, r:373, g:529, b:373)
        case .PaleTurquoise2:
            return (index:66, r:373, g:529, b:529)
        case .SteelBlue4:
            return (index:67, r:373, g:529, b:686)
        case .SteelBlue3:
            return (index:68, r:373, g:529, b:843)
        case .CornflowerBlue:
            return (index:69, r:373, g:529, b:1000)
        case .Chartreuse5:
            return (index:70, r:373, g:686, b:0)
        case .DarkSeaGreen8:
            return (index:71, r:373, g:686, b:373)
        case .CadetBlue1:
            return (index:72, r:373, g:686, b:529)
        case .CadetBlue:
            return (index:73, r:373, g:686, b:686)
        case .SkyBlue3:
            return (index:74, r:373, g:686, b:843)
        case .SteelBlue2:
            return (index:75, r:373, g:686, b:1000)
        case .Chartreuse4:
            return (index:76, r:373, g:843, b:0)
        case .PaleGreen4:
            return (index:77, r:373, g:843, b:373)
        case .SeaGreen4:
            return (index:78, r:373, g:843, b:529)
        case .Aquamarine3:
            return (index:79, r:373, g:843, b:686)
        case .MediumTurquoise:
            return (index:80, r:373, g:843, b:843)
        case .SteelBlue1:
            return (index:81, r:373, g:843, b:1000)
        case .Chartreuse3:
            return (index:82, r:373, g:1000, b:0)
        case .SeaGreen3:
            return (index:83, r:373, g:1000, b:373)
        case .SeaGreen2:
            return (index:84, r:373, g:1000, b:529)
        case .SeaGreen1:
            return (index:85, r:373, g:1000, b:686)
        case .Aquamarine2:
            return (index:86, r:373, g:1000, b:843)
        case .DarkSlateGray3:
            return (index:87, r:373, g:1000, b:1000)
        case .DarkRed:
            return (index:88, r:529, g:0, b:0)
        case .DeepPink7:
            return (index:89, r:529, g:0, b:373)
        case .DarkMagenta1:
            return (index:90, r:529, g:0, b:529)
        case .DarkMagenta:
            return (index:91, r:529, g:0, b:686)
        case .DarkViolet1:
            return (index:92, r:529, g:0, b:843)
        case .Purple1:
            return (index:93, r:529, g:0, b:1000)
        case .Orange3:
            return (index:94, r:529, g:373, b:0)
        case .LightPink3:
            return (index:95, r:529, g:373, b:373)
        case .Plum4:
            return (index:96, r:529, g:373, b:529)
        case .MediumPurple6:
            return (index:97, r:529, g:373, b:686)
        case .MediumPurple5:
            return (index:98, r:529, g:373, b:843)
        case .SlateBlue1:
            return (index:99, r:529, g:373, b:1000)
        case .Yellow6:
            return (index:100, r:529, g:529, b:0)
        case .Wheat2:
            return (index:101, r:529, g:529, b:373)
        case .Grey53:
            return (index:102, r:529, g:529, b:529)
        case .LightSlateGrey:
            return (index:103, r:529, g:529, b:686)
        case .MediumPurple4:
            return (index:104, r:529, g:529, b:843)
        case .LightSlateBlue:
            return (index:105, r:529, g:529, b:1000)
        case .Yellow5:
            return (index:106, r:529, g:686, b:0)
        case .DarkOliveGreen6:
            return (index:107, r:529, g:686, b:373)
        case .DarkSeaGreen7:
            return (index:108, r:529, g:686, b:529)
        case .LightSkyBlue3:
            return (index:109, r:529, g:686, b:686)
        case .LightSkyBlue2:
            return (index:110, r:529, g:686, b:843)
        case .SkyBlue2:
            return (index:111, r:529, g:686, b:1000)
        case .Chartreuse2:
            return (index:112, r:529, g:843, b:0)
        case .DarkOliveGreen5:
            return (index:113, r:529, g:843, b:373)
        case .PaleGreen3:
            return (index:114, r:529, g:843, b:529)
        case .DarkSeaGreen6:
            return (index:115, r:529, g:843, b:686)
        case .DarkSlateGray2:
            return (index:116, r:529, g:843, b:843)
        case .SkyBlue1:
            return (index:117, r:529, g:843, b:1000)
        case .Chartreuse1:
            return (index:118, r:529, g:1000, b:0)
        case .LightGreen1:
            return (index:119, r:529, g:1000, b:373)
        case .LightGreen:
            return (index:120, r:529, g:1000, b:529)
        case .PaleGreen2:
            return (index:121, r:529, g:1000, b:686)
        case .Aquamarine1:
            return (index:122, r:529, g:1000, b:843)
        case .DarkSlateGray1:
            return (index:123, r:529, g:1000, b:1000)
        case .Red3:
            return (index:124, r:686, g:0, b:0)
        case .DeepPink6:
            return (index:125, r:686, g:0, b:373)
        case .MediumVioletRed:
            return (index:126, r:686, g:0, b:529)
        case .Magenta6:
            return (index:127, r:686, g:0, b:686)
        case .DarkViolet:
            return (index:128, r:686, g:0, b:843)
        case .Purple:
            return (index:129, r:686, g:0, b:1000)
        case .DarkOrange2:
            return (index:130, r:686, g:373, b:0)
        case .IndianRed4:
            return (index:131, r:686, g:373, b:373)
        case .HotPink4:
            return (index:132, r:686, g:373, b:529)
        case .MediumOrchid4:
            return (index:133, r:686, g:373, b:686)
        case .MediumOrchid3:
            return (index:134, r:686, g:373, b:843)
        case .MediumPurple3:
            return (index:135, r:686, g:373, b:1000)
        case .DarkGoldenrod:
            return (index:136, r:686, g:529, b:0)
        case .LightSalmon3:
            return (index:137, r:686, g:529, b:373)
        case .RosyBrown:
            return (index:138, r:686, g:529, b:529)
        case .Grey63:
            return (index:139, r:686, g:529, b:686)
        case .MediumPurple2:
            return (index:140, r:686, g:529, b:843)
        case .MediumPurple1:
            return (index:141, r:686, g:529, b:1000)
        case .Gold3:
            return (index:142, r:686, g:686, b:0)
        case .DarkKhaki:
            return (index:143, r:686, g:686, b:373)
        case .NavajoWhite2:
            return (index:144, r:686, g:686, b:529)
        case .Grey69:
            return (index:145, r:686, g:686, b:686)
        case .LightSteelBlue3:
            return (index:146, r:686, g:686, b:843)
        case .LightSteelBlue2:
            return (index:147, r:686, g:686, b:1000)
        case .Yellow4:
            return (index:148, r:686, g:843, b:0)
        case .DarkOliveGreen4:
            return (index:149, r:686, g:843, b:373)
        case .DarkSeaGreen5:
            return (index:150, r:686, g:843, b:529)
        case .DarkSeaGreen4:
            return (index:151, r:686, g:843, b:686)
        case .LightCyan2:
            return (index:152, r:686, g:843, b:843)
        case .LightSkyBlue1:
            return (index:153, r:686, g:843, b:1000)
        case .GreenYellow:
            return (index:154, r:686, g:1000, b:0)
        case .DarkOliveGreen3:
            return (index:155, r:686, g:1000, b:373)
        case .PaleGreen1:
            return (index:156, r:686, g:1000, b:529)
        case .DarkSeaGreen3:
            return (index:157, r:686, g:1000, b:686)
        case .DarkSeaGreen2:
            return (index:158, r:686, g:1000, b:843)
        case .PaleTurquoise1:
            return (index:159, r:686, g:1000, b:1000)
        case .Red2:
            return (index:160, r:843, g:0, b:0)
        case .DeepPink5:
            return (index:161, r:843, g:0, b:373)
        case .DeepPink4:
            return (index:162, r:843, g:0, b:529)
        case .Magenta5:
            return (index:163, r:843, g:0, b:686)
        case .Magenta4:
            return (index:164, r:843, g:0, b:843)
        case .Magenta3:
            return (index:165, r:843, g:0, b:1000)
        case .DarkOrange1:
            return (index:166, r:843, g:373, b:0)
        case .IndianRed3:
            return (index:167, r:843, g:373, b:373)
        case .HotPink3:
            return (index:168, r:843, g:373, b:529)
        case .HotPink2:
            return (index:169, r:843, g:373, b:686)
        case .Orchid3:
            return (index:170, r:843, g:373, b:843)
        case .MediumOrchid2:
            return (index:171, r:843, g:373, b:1000)
        case .Orange2:
            return (index:172, r:843, g:529, b:0)
        case .LightSalmon2:
            return (index:173, r:843, g:529, b:373)
        case .LightPink2:
            return (index:174, r:843, g:529, b:529)
        case .Pink2:
            return (index:175, r:843, g:529, b:686)
        case .Plum3:
            return (index:176, r:843, g:529, b:843)
        case .Violet:
            return (index:177, r:843, g:529, b:1000)
        case .Gold2:
            return (index:178, r:843, g:686, b:0)
        case .LightGoldenrod5:
            return (index:179, r:843, g:686, b:373)
        case .Tan:
            return (index:180, r:843, g:686, b:529)
        case .MistyRose2:
            return (index:181, r:843, g:686, b:686)
        case .Thistle2:
            return (index:182, r:843, g:686, b:843)
        case .Plum2:
            return (index:183, r:843, g:686, b:1000)
        case .Yellow3:
            return (index:184, r:843, g:843, b:0)
        case .Khaki2:
            return (index:185, r:843, g:843, b:373)
        case .LightGoldenrod4:
            return (index:186, r:843, g:843, b:529)
        case .LightYellow3:
            return (index:187, r:843, g:843, b:686)
        case .Grey84:
            return (index:188, r:843, g:843, b:843)
        case .LightSteelBlue1:
            return (index:189, r:843, g:843, b:1000)
        case .Yellow2:
            return (index:190, r:843, g:1000, b:0)
        case .DarkOliveGreen2:
            return (index:191, r:843, g:1000, b:373)
        case .DarkOliveGreen1:
            return (index:192, r:843, g:1000, b:529)
        case .DarkSeaGreen1:
            return (index:193, r:843, g:1000, b:686)
        case .Honeydew2:
            return (index:194, r:843, g:1000, b:843)
        case .LightCyan1:
            return (index:195, r:843, g:1000, b:1000)
        case .Red1:
            return (index:196, r:1000, g:0, b:0)
        case .DeepPink3:
            return (index:197, r:1000, g:0, b:373)
        case .DeepPink2:
            return (index:198, r:1000, g:0, b:529)
        case .DeepPink1:
            return (index:199, r:1000, g:0, b:686)
        case .Magenta2:
            return (index:200, r:1000, g:0, b:843)
        case .Magenta1:
            return (index:201, r:1000, g:0, b:1000)
        case .OrangeRed1:
            return (index:202, r:1000, g:373, b:0)
        case .IndianRed2:
            return (index:203, r:1000, g:373, b:373)
        case .IndianRed1:
            return (index:204, r:1000, g:373, b:529)
        case .HotPink1:
            return (index:205, r:1000, g:373, b:686)
        case .HotPink:
            return (index:206, r:1000, g:373, b:843)
        case .MediumOrchid1:
            return (index:207, r:1000, g:373, b:1000)
        case .DarkOrange:
            return (index:208, r:1000, g:529, b:0)
        case .Salmon1:
            return (index:209, r:1000, g:529, b:373)
        case .LightCoral:
            return (index:210, r:1000, g:529, b:529)
        case .PaleVioletRed1:
            return (index:211, r:1000, g:529, b:686)
        case .Orchid2:
            return (index:212, r:1000, g:529, b:843)
        case .Orchid1:
            return (index:213, r:1000, g:529, b:1000)
        case .Orange1:
            return (index:214, r:1000, g:686, b:0)
        case .SandyBrown:
            return (index:215, r:1000, g:686, b:373)
        case .LightSalmon1:
            return (index:216, r:1000, g:686, b:529)
        case .LightPink1:
            return (index:217, r:1000, g:686, b:686)
        case .Pink1:
            return (index:218, r:1000, g:686, b:843)
        case .Plum1:
            return (index:219, r:1000, g:686, b:1000)
        case .Gold1:
            return (index:220, r:1000, g:843, b:0)
        case .LightGoldenrod3:
            return (index:221, r:1000, g:843, b:373)
        case .LightGoldenrod2:
            return (index:222, r:1000, g:843, b:529)
        case .NavajoWhite1:
            return (index:223, r:1000, g:843, b:686)
        case .MistyRose1:
            return (index:224, r:1000, g:843, b:843)
        case .Thistle1:
            return (index:225, r:1000, g:843, b:1000)
        case .Yellow1:
            return (index:226, r:1000, g:1000, b:0)
        case .LightGoldenrod1:
            return (index:227, r:1000, g:1000, b:373)
        case .Khaki1:
            return (index:228, r:1000, g:1000, b:529)
        case .Wheat1:
            return (index:229, r:1000, g:1000, b:686)
        case .Cornsilk1:
            return (index:230, r:1000, g:1000, b:843)
        case .Grey100:
            return (index:231, r:1000, g:1000, b:1000)
        case .Grey3:
            return (index:232, r:31, g:31, b:31)
        case .Grey7:
            return (index:233, r:71, g:71, b:71)
        case .Grey11:
            return (index:234, r:110, g:110, b:110)
        case .Grey15:
            return (index:235, r:149, g:149, b:149)
        case .Grey19:
            return (index:236, r:188, g:188, b:188)
        case .Grey23:
            return (index:237, r:227, g:227, b:227)
        case .Grey27:
            return (index:238, r:267, g:267, b:267)
        case .Grey30:
            return (index:239, r:306, g:306, b:306)
        case .Grey35:
            return (index:240, r:345, g:345, b:345)
        case .Grey39:
            return (index:241, r:384, g:384, b:384)
        case .Grey42:
            return (index:242, r:424, g:424, b:424)
        case .Grey46:
            return (index:243, r:463, g:463, b:463)
        case .Grey50:
            return (index:244, r:502, g:502, b:502)
        case .Grey54:
            return (index:245, r:541, g:541, b:541)
        case .Grey58:
            return (index:246, r:580, g:580, b:580)
        case .Grey62:
            return (index:247, r:620, g:620, b:620)
        case .Grey66:
            return (index:248, r:659, g:659, b:659)
        case .Grey70:
            return (index:249, r:698, g:698, b:698)
        case .Grey74:
            return (index:250, r:737, g:737, b:737)
        case .Grey78:
            return (index:251, r:776, g:776, b:776)
        case .Grey82:
            return (index:252, r:816, g:816, b:816)
        case .Grey85:
            return (index:253, r:855, g:855, b:855)
        case .Grey89:
            return (index:254, r:894, g:894, b:894)
        case .Grey93:
            return (index:255, r:933, g:933, b:933)
        }
    }
}
