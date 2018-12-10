import XCTest
@testable import SCICoreTools

class UITextFieldExtensionsTests: XCTestCase {

    func testIsEmpty() {
        let textField = UITextField()
        textField.text = " "
        XCTAssertFalse(textField.isEmpty)
        textField.text = ""
        XCTAssertTrue(textField.isEmpty)
    }
}
