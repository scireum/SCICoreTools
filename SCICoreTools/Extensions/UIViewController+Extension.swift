import Foundation

public extension UIViewController {
    /**
     Shows a simple system alert with an action to dismiss.

     - parameters:
     - title: The title of the alert.
     - message: The message of the alert.
     */
    func showSimpleAlert(title: String, message: String, completion: (()->())? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: completion)
    }
    /**
     Shows a simple system action sheet with an action to dismiss.

     - parameters:
     - title: The title of the alert.
     - message: The message of the alert.
     */
    func showSimpleActionSheet(title: String, message: String, completion: (()->())? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: completion)
    }
}
