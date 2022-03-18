import Foundation
import XCTest
@testable import SwiftNCurses

final class TerminalTests: XCTestCase {
    var sut: Terminal!

    override func setUp() {
        sut = Terminal(colorPalette: nil)
    }

    override func tearDown() {
        sut = nil
    }

    //MARK: init tests

    func test_init_setsStandardScreen() {
        XCTAssertNotNil(sut.standardScreen)
    }

    func test_init_givenInputModeNoraw_setsCurrentModeToNoraw() throws {
        let expectedMode: InputMode = .noraw
        sut = Terminal(mode: expectedMode, colorPalette: nil)
        XCTAssertTrue(sut.currentMode == expectedMode)
    }

    func test_init_givenEchoingTrue_setsEchoingToTrue() {
        sut = Terminal(echoing: true, colorPalette: nil)
        XCTAssertTrue(sut.echoing)
    }

    func test_init_givenKeypadEnabledFalse_setsKeypadEnabledToFalse() {
        sut = Terminal(keypadEnabled: false, colorPalette: nil)
        XCTAssertFalse(sut.keypadEnabled)
    }


}
