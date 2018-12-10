import Foundation

public extension Date {

    /**
     Get date as ISO 8601 string.
     - Returns: ISO 8601 string from date
     */
    var iso8601: String {
        return Formatter.iso8601.string(from: self)
    }
}
