public enum ModelName: String {
    case iPodTouch5 = "iPod Touch (5th Gen)"
    case iPodTouch6 = "iPod Touch (6th Gen)"
    case iPodTouch7 = "iPod Touch (7th Gen)"

    case iPhone4 = "iPhone 4"
    case iPhone4S = "iPhone 4s"
    case iPhone5 = "iPhone 5"
    case iPhone5C = "iPhone 5c"
    case iPhone5S = "iPhone 5s"
    case iPhone6 = "iPhone 6"
    case iPhone6Plus = "iPhone 6 Plus"
    case iPhone6S = "iPhone 6s"
    case iPhone6SPlus = "iPhone 6s Plus"
    case iPhone7 = "iPhone 7"
    case iPhone7Plus = "iPhone 7 Plus"
    case iPhoneSE_1 = "iPhone SE (1st Gen)"
    case iPhoneSE_2 = "iPhone SE (2nd Gen)"
    case iPhone8 = "iPhone 8"
    case iPhone8Plus = "iPhone 8 Plus"
    case iPhoneX = "iPhone X"
    case iPhoneXS = "iPhone XS"
    case iPhoneXSMax = "iPhone XS Max"
    case iPhoneXR = "iPhone XR"
    case iPhone11 = "iPhone 11"
    case iPhone11Pro = "iPhone 11 Pro"
    case iPhone11ProMax = "iPhone 11 Pro Max"
    case iPhone12 = "iPhone 12"
    case iPhone12Pro = "iPhone 12 Pro"
    case iPhone12ProMax = "iPhone Pro Max"
    case iPhone12Mini = "iPhone 12 mini"
    case iPhone13 = "iPhone 13"
    case iPhone13Pro = "iPhone 13 Pro"
    case iPhone13ProMax = "iPhone 13 Pro Max"
    case iPhone13Mini = "iPhone 13 mini"

    case iPad2 = "iPad 2"
    case iPad_3rdGen = "iPad (3rd Gen)"
    case iPad_4thGen = "iPad (4th Gen)"
    case iPad_5thGen = "iPad (5th Gen)"
    case iPad_6thGen = "iPad (6th Gen)"
    case iPad_7thGen = "iPad (7th Gen)"
    case iPad_8thGen = "iPad (8th Gen)"
    case iPad_9thGen = "iPad (9th Gen)"

    case iPadAir = "iPad Air"
    case iPadAir2 = "iPad Air 2"
    case iPadAir_3rdGen = "iPad Air (3rd Gen)"
    case iPadAir_4thGen = "iPad Air (4th Gen)"

    case iPadMini = "iPad mini"
    case iPadMini2 = "iPad mini 2"
    case iPadMini3 = "iPad mini 3"
    case iPadMini4 = "iPad mini 4"
    case iPadMini_5thGen = "iPad mini (5th Gen)"
    case iPadMini_6thGen = "iPad mini (6th Gen)"

    case iPadPro_1stGen_9_7Inch = "iPad Pro (1st Gen, 9.7 inch)"
    case iPadPro_1stGen_12_9Inch = "iPad Pro (1st Gen, 12.9 inch)"
    case iPadPro_2ndGen_10_5Inch = "iPad Pro (2nd Gen, 10.5 inch)"
    case iPadPro_2ndGen_12_9Inch = "iPad Pro (2nd Gen, 12.9 inch)"
    case iPadPro_3rdGen_11Inch = "iPad Pro (3rd Gen, 11 inch)"
    case iPadPro_3rdGen_12_9Inch = "iPad Pro (3rd Gen, 12.9 inch)"
    case iPadPro_4thGen_11Inch = "iPad Pro (4th Gen, 11 inch)"
    case iPadPro_4thGen_12_9Inch = "iPad Pro (4th Gen, 12.9 inch)"
    case iPadPro_5thGen_11Inch = "iPad Pro (5th Gen, 11 inch)"
    case iPadPro_5thGen_12_9Inch = "iPad Pro (5th Gen, 12.9 inch)"

    case appleTV_4thGen = "Apple TV (4th Gen)"
    case appleTV_5thGen = "Apple TV (5th Gen)"

    case homePod

    case other
}

public extension UIDevice {

    /// pares the deveice name as the standard name
    var modelName: ModelName {

        #if targetEnvironment(simulator)
        let identifier = ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"]!
        #else
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8 , value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        #endif

        // see https://gist.github.com/adamawolf/3048717
        switch identifier {

        case "iPod5,1":
            return .iPodTouch5
        case "iPod7,1":
            return .iPodTouch6
        case "iPod9,1":
            return .iPodTouch7

        case "iPhone3,1", "iPhone3,2", "iPhone3,3":
            return .iPhone4
        case "iPhone4,1":
            return .iPhone4S
        case "iPhone5,1", "iPhone5,2":
            return .iPhone5
        case "iPhone5,3", "iPhone5,4":
            return .iPhone5C
        case "iPhone6,1", "iPhone6,2":
            return .iPhone5S
        case "iPhone7,2":
            return .iPhone6
        case "iPhone7,1":
            return .iPhone6Plus
        case "iPhone8,1":
            return .iPhone6S
        case "iPhone8,2":
            return .iPhone6SPlus
        case "iPhone9,1", "iPhone9,3":
            return .iPhone7
        case "iPhone9,2", "iPhone9,4":
            return .iPhone7Plus
        case "iPhone8,4":
            return .iPhoneSE_1
        case "iPhone10,1", "iPhone10,4":
            return .iPhone8
        case "iPhone10,2", "iPhone10,5":
            return .iPhone8Plus
        case "iPhone10,3", "iPhone10,6":
            return .iPhoneX
        case "iPhone11,2":
            return .iPhoneXS
        case "iPhone11,4", "iPhone11,6":
            return .iPhoneXSMax
        case "iPhone11,8":
            return .iPhoneXR
        case "iPhone12,1":
            return .iPhone11
        case "iPhone12,3":
            return .iPhone11Pro
        case "iPhone12,5":
            return .iPhone11ProMax
        case "iPhone12,8":
            return .iPhoneSE_2
        case "iPhone13,1":
            return .iPhone12Mini
        case "iPhone13,2":
            return .iPhone12
        case "iPhone13,3":
            return .iPhone12Pro
        case "iPhone13,4":
            return .iPhone12ProMax
        case "iPhone14,2":
            return .iPhone13Pro
        case "iPhone14,3":
            return .iPhone13ProMax
        case "iPhone14,4":
            return .iPhone13Mini
        case "iPhone14,5":
            return .iPhone13

        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":
            return .iPad2
        case "iPad2,5", "iPad2,6", "iPad2,7":
            return .iPadMini
        case "iPad3,1", "iPad3,2", "iPad3,3":
            return .iPad_3rdGen
        case "iPad3,4", "iPad3,5", "iPad3,6":
            return .iPad_4thGen
        case "iPad4,1", "iPad4,2", "iPad4,3":
            return .iPadAir
        case "iPad4,4", "iPad4,5", "iPad4,6":
            return .iPadMini2
        case "iPad4,7", "iPad4,8", "iPad4,9":
            return .iPadMini3
        case "iPad5,1", "iPad5,2":
            return .iPadMini4
        case "iPad5,3", "iPad5,4":
            return .iPadAir2
        case "iPad6,3", "iPad6,4":
            return .iPadPro_1stGen_9_7Inch
        case "iPad6,7", "iPad6,8":
            return .iPadPro_1stGen_12_9Inch
        case "iPad6,11", "iPad6,12":
            return .iPad_5thGen
        case "iPad7,1", "iPad7,2":
            return .iPadPro_2ndGen_12_9Inch
        case "iPad7,3", "iPad7,4":
            return .iPadPro_2ndGen_10_5Inch
        case "iPad7,5", "iPad7,6":
            return .iPad_6thGen
        case "iPad7,11", "iPad7,12":
            return .iPad_7thGen
        case "iPad8,1", "iPad8,2", "iPad8,3", "iPad8,4":
            return .iPadPro_3rdGen_11Inch
        case "iPad8,5", "iPad8,6", "iPad8,7", "iPad8,8":
            return .iPadPro_3rdGen_12_9Inch
        case "iPad8,9", "iPad8,10":
            return .iPadPro_4thGen_11Inch
        case "iPad8,11", "iPad8,12":
            return .iPadPro_4thGen_12_9Inch
        case "iPad11,1", "iPad11,2":
            return .iPadMini_5thGen
        case "iPad11,3", "iPad11,4":
            return .iPadAir_3rdGen
        case "iPad11,6", "iPad11,7":
            return .iPad_8thGen
        case "iPad12,1", "iPad12,2":
            return .iPad_9thGen
        case "iPad14,1", "iPad14,2":
            return .iPadMini_6thGen
        case "iPad13,1", "iPad13,2":
            return .iPadAir_4thGen
        case "iPad13,4", "iPad13,5", "iPad13,6", "iPad13,7":
            return .iPadPro_5thGen_11Inch
        case "iPad13,8", "iPad13,9", "iPad13,10", "iPad13,11":
            return .iPadPro_5thGen_12_9Inch

        case "AppleTV5,3":
            return .appleTV_4thGen
        case "AppleTV6,2":
            return .appleTV_5thGen

        case "AudioAccessory1,1":
            return .homePod

        default:
            return .other
        }
    }
}

