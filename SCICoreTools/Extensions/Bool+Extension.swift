import Foundation

public extension Bool {

    /**
     Return 1 or 0
    */
    var intValue: Int {
        return self ? 1 : 0
    }

    /**
     Return "true" or "false"
    */
    var stringValue: String {
        return description
    }

}
