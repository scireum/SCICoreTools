import XCTest
@testable import SCICoreTools

class StringExtensionsTests: XCTestCase {

    func testBlank() {
        XCTAssertTrue("".isBlank)
        XCTAssertTrue(" ".isBlank)
        XCTAssertFalse("s".isBlank)
    }

    func testIsValidEmail() {
        XCTAssertTrue("max@max.de".isValidEmail)
        XCTAssertFalse("max@max".isValidEmail)
        XCTAssertFalse("@domain.com".isValidEmail)
        XCTAssertFalse("#@%^%#$@#$@#.com".isValidEmail)
    }

    func testIsValidSchemedUrl() {
        XCTAssert("https://google.com".isValidSchemedUrl)
        XCTAssert("ftp://google.com".isValidSchemedUrl)
        XCTAssertFalse("google.com".isValidSchemedUrl)
        XCTAssertFalse("test".isValidSchemedUrl)
    }

    func testLocalized() {
        XCTAssertEqual("Test".localized(), NSLocalizedString("Test", comment: ""))
        let helloWorld = "HelloWorld"
        XCTAssertEqual(helloWorld.localized(), NSLocalizedString(helloWorld, comment: ""))
    }

    func testisValidHttpsUrl() {
        XCTAssertTrue("https://google.com".isValidHttpsUrl)
        XCTAssertFalse("http://google.com".isValidHttpsUrl)
    }

    func testisValidHttpUrl() {
        XCTAssertFalse("https://google.com".isValidHttpUrl)
        XCTAssertTrue("http://google.com".isValidHttpUrl)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
