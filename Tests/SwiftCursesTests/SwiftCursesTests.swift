import Foundation
import XCTest
@testable import SwiftCurses

final class SwiftCursesTests: XCTestCase {
    var terminal = Terminal()
    func testExample() throws {
        terminal.print("HI\n\n\n\n\n")
        sleep(3)
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        //sXCTAssertEqual(SwiftCurses().text, "Hello, World!")
    }
}
