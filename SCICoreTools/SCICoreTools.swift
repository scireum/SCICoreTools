import Foundation

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
}

