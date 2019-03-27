import Foundation

public extension UIStoryboard {

    /**
     Main storyboard for application.
     - Returns: Main storyboard.
     */
    static var main: UIStoryboard? {
        let bundle = Bundle.main
        guard let name = bundle.object(forInfoDictionaryKey: "UIMainStoryboardFile") as? String else { return nil }
        return UIStoryboard(name: name, bundle: bundle)
    }

    /**
     Instantiate a UIViewController using its class name, Identity > StoryboardID has to be the same as the name from the UIViewController class.
     - Parameter name: UIViewController type.
     - Returns: The view controller to specified class name.
     */
    func instantiateViewController<T: UIViewController>(withClass name: T.Type) -> T? {
        return instantiateViewController(withIdentifier: String(describing: name)) as? T
    }

}
