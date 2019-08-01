import XCTest
@testable import HapticButton

final class HapticButtonTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(HapticButton().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
