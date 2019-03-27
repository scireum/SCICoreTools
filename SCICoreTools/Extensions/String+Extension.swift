import Foundation
import UIKit

public extension String {

    /**
     Check if String is blank.
     - Returns: Boolvalue
     */
    var isBlank: Bool {
        return self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }

    /**
     Returns a localized string, with an optional comment for translators.
     */
    func localized(comment: String = "") -> String {
        return NSLocalizedString(self, comment: comment)
    }

    /**
     First character of a string.
     */
    var firstCharacterAsString: String? {
        guard let first = first else { return nil }
        return String(first)
    }

    /**
     Last character of a string.
     */
    var lastCharacterAsString: String? {
        guard let last = last else { return nil }
        return String(last)
    }

    /**
     Check if string is valid email format.
     - Note: Note that this property does not validate the email address against an email server.
     */
    var isValidEmail: Bool {
        // http://emailregex.com/
        let regex = "^(?:[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[\\p{L}0-9](?:[a-z0-9-]*[\\p{L}0-9])?\\.)+[\\p{L}0-9](?:[\\p{L}0-9-]*[\\p{L}0-9])?|\\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[\\p{L}0-9-]*[\\p{L}0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])$"
        return range(of: regex, options: .regularExpression, range: nil, locale: nil) != nil
    }

    /**
     Check if string is a valid schemed URL.
    */
    var isValidSchemedUrl: Bool {
        guard let url = URL(string: self) else { return false }
        return url.scheme != nil
    }

    /**
     Check if string is a valid https URL.
     */
    var isValidHttpsUrl: Bool {
        guard let url = URL(string: self) else { return false }
        return url.scheme == "https"
    }

    /**
     Check if string is a valid http URL.
     */
    var isValidHttpUrl: Bool {
        guard let url = URL(string: self) else { return false }
        return url.scheme == "http"
    }

    /**
     Get Date from ISO 8601 string
     - Returns: Date from ISO 8601 string
    */
    var dateFromISO8601: Date? {
        return Formatter.iso8601.date(from: self)
    }

    /**
     Transforms the string into a chained dash string.
     - Returns: chained dash string
     */
    func chainWithDashes() -> String {
        let lowercased = self.lowercased()
        let withDashes = lowercased.replacingOccurrences(of: " ", with: "-")

        let alphanumerics = NSCharacterSet.alphanumerics
        var filtered = withDashes.filter {
            guard String($0) != "-" else { return true }
            guard String($0) != "&" else { return true }
            return String($0).rangeOfCharacter(from: alphanumerics) != nil
        }

        while filtered.lastCharacterAsString == "-" {
            filtered = String(filtered.dropLast())
        }

        while filtered.firstCharacterAsString == "-" {
            filtered = String(filtered.dropFirst())
        }

        return filtered.replacingOccurrences(of: "--", with: "-")
    }

}

public extension String {
    func hasOneOfPrefixes(_ prefixes: [String]) -> Bool {
        for prefix in prefixes {
            if self.hasPrefix(prefix) {
                return true
            }
        }
        return false
    }
}
