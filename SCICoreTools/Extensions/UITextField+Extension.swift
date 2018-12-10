import Foundation

public extension UITextField {

    /**
     Check if UI Text Field is empty
     - Returns: Boolvalue
    */
    var isEmpty: Bool {
        return self.text?.isEmpty == true
    }

}
