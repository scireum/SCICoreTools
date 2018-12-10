import Foundation

/**
 Loading View Controller with Identifier from named Storyboard
 - Returns: UIViewController?
 */
public func loadControllerFromStoryboard(name: String, withIdentifier identifier: String, bundle: Bundle? = nil) -> UIViewController? {
    let storyboard = UIStoryboard(name: name, bundle: bundle)
    return storyboard.instantiateViewController(withIdentifier: identifier)
}

public struct SCICoreTools {
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
}

