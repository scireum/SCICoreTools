import XCTest
@testable import SCICoreTools

class IntExtensionsTests: XCTestCase {

    func testDegreesToRadians() {
        let x = 3
        let y = CGFloat(x) * .pi / 180
        XCTAssertEqual(x.degreesToRadians, y)
        XCTAssertFalse(CGFloat(x) == y)

    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
