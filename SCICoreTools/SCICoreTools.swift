import Foundation


public enum Screen: CGFloat {
    case unknown     = 0
    case inches_3_5  = 3.5
    case inches_4_0  = 4.0
    case inches_4_7  = 4.7
    case inches_5_5  = 5.5
    case inches_5_8  = 5.8
    case inches_6_1  = 6.1
    case inches_6_5  = 6.5
    case inches_7_9  = 7.9
    case inches_9_7  = 9.7
    case inches_10_5 = 10.5
    case inches_11_0 = 11.0
    case inches_12_9 = 12.9
}

public enum Scale: CGFloat, Comparable, Equatable {
    case x1      = 1.0
    case x2      = 2.0
    case x3      = 3.0
    case unknown = 0
}

public func ==(lhs: Scale, rhs: Scale) -> Bool {
    guard lhs.rawValue > 0 && rhs.rawValue > 0 else { return false }
    return lhs.rawValue == rhs.rawValue
}

public func <(lhs: Scale, rhs: Scale) -> Bool {
    guard lhs.rawValue > 0 && rhs.rawValue > 0 else { return false }
    return lhs.rawValue < rhs.rawValue
}

public func >(lhs: Scale, rhs: Scale) -> Bool {
    guard lhs.rawValue > 0 && rhs.rawValue > 0 else { return false }
    return lhs.rawValue > rhs.rawValue
}

public func <=(lhs: Scale, rhs: Scale) -> Bool {
    guard lhs.rawValue > 0 && rhs.rawValue > 0 else { return false }
    return lhs.rawValue <= rhs.rawValue
}

public func >=(lhs: Scale, rhs: Scale) -> Bool {
    guard lhs.rawValue > 0 && rhs.rawValue > 0 else { return false }
    return lhs.rawValue >= rhs.rawValue
}

public struct SCICoreTools {

    /**
     Loading View Controller with Identifier from named Storyboard
     - Returns: UIViewController?
     */
    public static func loadControllerFromStoryboard(name: String, withIdentifier identifier: String, bundle: Bundle? = nil) -> UIViewController? {
        let storyboard = UIStoryboard(name: name, bundle: bundle)
        return storyboard.instantiateViewController(withIdentifier: identifier)
    }

    /**
    Check if device is iPad.
    - Returns: Boolvalue
    */
    public static var isPad: Bool {
        return UIDevice.current.userInterfaceIdiom == .pad
    }

    /**
    Check if device is iPhone.
    - Returns: Boolvalue
    */
    public static var isPhone: Bool {
        return UIDevice.current.userInterfaceIdiom == .phone
    }

    /**
     Check if app is running in debug mode.
      - Returns: Boolvalue
     */
    public static var isInDebugMode: Bool {
        // http://stackoverflow.com/questions/9063100/xcode-ios-how-to-determine-whether-code-is-running-in-debug-release-build
        #if DEBUG
        return true
        #else
        return false
        #endif
    }

    /**
     Check if app is running in release mode.
      - Returns: Boolvalue
     */
    public static var isInReleaseMode: Bool {
        // http://stackoverflow.com/questions/9063100/xcode-ios-how-to-determine-whether-code-is-running-in-debug-release-build
        #if DEBUG
        return false
        #else
        return true
        #endif
    }

    /**
     Get current battery level.
     - Returns: Floatvalue
     */
    public static var batteryLevel: Float {
        return UIDevice.current.batteryLevel
    }

    /**
     Check if app is running from Testflight
     - Returns: Boolvalue
     */
    public static var isInTestFlight: Bool {
        // http://stackoverflow.com/questions/12431994/detect-testflight
        return Bundle.main.appStoreReceiptURL?.path.contains("sandboxReceipt") == true
    }

    /**
     Get App current name.
     */
    public static var appName: String? {
        return Bundle.main.infoDictionary?["CFBundleName"] as? String
    }

    /**
    Get App current version.
    */
    public static var appVersion: String? {
        return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    }

    /**
    Get current device model.
     */
    public static var deviceModel: String {
        return UIDevice.current.model
    }

    /**
     Get current device orientation.
     */
    public static var deviceOrientation: UIDeviceOrientation {
        return UIDevice.current.orientation
    }

    /**
     Get current device custom name.
     */
    public static var deviceName: String {
        return UIDevice.current.name
    }

    /**
     Get current device system name.
     */
    public static var deviceSystemName: String {
        return UIDevice.current.systemName
    }

    /**
     Get current device system version.
     */
    public static var deviceSystemVersion: String {
        return UIDevice.current.systemVersion
    }

    /**
    Get screen width.
    */
    public static var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }

    /**
     Get screen height.
     */
    public static var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }

    public struct UserAgent {

        /**
         Get current device name.
        */
        public static var deviceName: String {
            var sysinfo = utsname()
            uname(&sysinfo)
            return String(bytes: Data(bytes: &sysinfo.machine, count: Int(_SYS_NAMELEN)), encoding: .ascii)!.trimmingCharacters(in: .controlCharacters)
        }

        /**
         Get CFNetwork version.
         */
        public static var CFNetworkVersion: String {
            return Bundle(identifier: "com.apple.CFNetwork")?.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
        }

        /**
         Get darwin version.
         */
        public static var darwinVersion: String {
            var sysinfo = utsname()
            uname(&sysinfo)
            return String(bytes: Data(bytes: &sysinfo.release, count: Int(_SYS_NAMELEN)), encoding: .ascii)!.trimmingCharacters(in: .controlCharacters)
        }
    }

    /**
     Check if current device is ipad and have no homebutton
     - Returns: Boolvalue
     */
    public var isIpadProWithoutHomebutton: Bool {
        return SCICoreTools.isPad && (SCICoreTools.screen == .inches_11_0 || SCICoreTools.screen == .inches_12_9)
    }

    /**
     Get the screensize of current device
     - Returns: CGFloatvalue
     */
    static public var screen: Screen {
        let size = max(SCICoreTools.screenWidth, SCICoreTools.screenHeight)

        switch size {
        case 480:
            return .inches_3_5

        case 568:
            return .inches_4_0

        case 667:
            return ( scale == .x3 ? .inches_5_5 : .inches_4_7 )

        case 736:
            return .inches_5_5

        case 812:
            return .inches_5_8

        case 896:
            return ( scale == .x3 ? .inches_6_5 : .inches_6_1 )

        case 1024:
            return .inches_9_7

        case 1366:
            return .inches_12_9

        default:
            return .unknown
        }
    }

    /**
     Get the scale of current device
     - Returns: CGFloatvalue
     */
    static public var scale: Scale {
        let scale = UIScreen.main.scale

        switch scale {
        case 1.0:
            return .x1

        case 2.0:
            return .x2

        case 3.0:
            return .x3

        default:
            return .unknown
        }
    }
}

