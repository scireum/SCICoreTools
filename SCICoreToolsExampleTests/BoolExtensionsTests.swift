import XCTest
@testable import SCICoreTools

class BoolExtensionsTests: XCTestCase {

    func testIntValue() {
        XCTAssertTrue(true.intValue == 1)
        XCTAssertTrue(false.intValue == 0)
    }

    func testStringValue() {
        XCTAssertEqual(true.stringValue, "true")
        XCTAssertEqual(false.stringValue, "false")
    }

}
