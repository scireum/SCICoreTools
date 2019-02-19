import Foundation

public extension UIViewController {
    /**
     Shows a simple system alert (style: .alert) with an action to dismiss.

     - parameters:
     - title: The title of the alert.
     - message: The message of the alert.
     */
    public func showSimpletAlert(title: String, message: String, completion: (()->())? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: completion)
    }
    /**
     Shows a simple system alert (style: .actionSheet) with an action to dismiss.

     - parameters:
     - title: The title of the alert.
     - message: The message of the alert.
     */
    public func showSimpleInfo(title: String, message: String, completion: (()->())? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: completion)
    }
}
