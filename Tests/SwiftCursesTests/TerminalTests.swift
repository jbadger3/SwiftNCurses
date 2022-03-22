import Foundation
import XCTest
@testable import SwiftNCurses
import ncurses

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

    func test_init_givenColorPaletteNil_colorEnabledIsFalse() {
        sut = Terminal(colorPalette: nil)
        XCTAssertFalse(sut.colors.colorsEnabled)
    }

    func test_setMode_whenModeSet_setsCurrentMode() {
        var expectedMode: InputMode = .raw
        sut.set(mode: expectedMode)
        XCTAssertEqual(sut.currentMode, expectedMode)
        expectedMode = .noraw
        sut.set(mode: expectedMode)
        XCTAssertEqual(sut.currentMode, expectedMode)
        expectedMode = .cbreak
        sut.set(mode: expectedMode)
        XCTAssertEqual(sut.currentMode, expectedMode)
        expectedMode = .nocbreak
        sut.set(mode: expectedMode)
        XCTAssertEqual(sut.currentMode, expectedMode)
    }

    func test_setEchoing_whenSet_setsStateVar() {
        var expectedState = false
        sut.set(echoing: expectedState)
        XCTAssertEqual(sut.echoing, expectedState)
        expectedState = true
        sut.set(echoing: expectedState)
        XCTAssertEqual(sut.echoing, expectedState)
    }

    func test_setKeypadEnabled_whenSet_setsStateVar() {
        var expectedState = false
        sut.set(keypadEnabled: expectedState)
        XCTAssertEqual(sut.keypadEnabled, expectedState)
        expectedState = true
        sut.set(keypadEnabled: expectedState)
        XCTAssertEqual(sut.keypadEnabled, expectedState)
    }

    func test_deleteCurrentCharacter_deletesCurrentCharacter() {
        addch(UInt32("t".utf8CString[0]))
        let populatedVal = mvinch(0,0)
        XCTAssertNotEqual(populatedVal, 0)

        sut.deleteCurrentCharacter()
        let finalValue = mvinch(0, 0)
        XCTAssertNotEqual(populatedVal, finalValue)
    }

    func test_deleteLastCharacter_deletesLastCharacter() {
        let testChar = UInt32("t".utf8CString[0])
        addch(UInt32("t".utf8CString[0]))
        XCTAssertEqual(testChar, mvinch(0, 0))
        move(0, 1)

        sut.deleteLastCharacter()
        XCTAssertNotEqual(testChar, mvinch(0, 0))
    }

    func test_deleteCharacterAtLocation_deletesCharacterAtSpecifiedLocation() {
        let testString = "Hello"
        addstr(testString.cString(using: .utf8))

        let testLocation = Location(x: 1, y: 0)
        sut.deleteCharacter(atLocation: testLocation)

        let expectedString = "Hllo"
        var cChar = CChar()
        mvinstr(0, 0, &cChar)
        XCTAssertEqual(String(cString:&cChar).trimmingCharacters(in: .whitespaces), expectedString)
    }

    func test_allContent_givenMultipleLines_properlyFormatsAndCapturesContents() {
        let expectedContent = """
        Hello world!
        Go fish.                   <><
        Peek    a    boo!
        """
        addstr(expectedContent.cString(using: .utf8))
        let receivedContent = sut.allContent()
        print(receivedContent)
        XCTAssertEqual(receivedContent, expectedContent)
    }

    func test_contentsStartingAtLocation_whenLocationProvided_movesCursorAndRetrievesCorrectContent() {
        let testContent = "Hi\nHello world"
        addstr(testContent.cString(using: .utf8))
        let expectedContent = "Hello world"
        let testLocation = Location(x: 0, y: 1)
        let retrievedContent = sut.contents(startingAt: testLocation)
        print(retrievedContent)
        XCTAssertEqual(retrievedContent, expectedContent)
    }

    func test_printKey_givenIgnoreControlKeysTrue_whenKeyIsPrintableControlKey_printsKey() {
        let testKey = Key(rawValue: 10) //line feed
        sut.print(key: testKey, ignoreControlKeys: true)
        let expectedLocation = Location(x:0, y:1)
        let location = sut.cursor.location
        XCTAssertEqual(location, expectedLocation)
    }

    func test_printKey_givenIgnoreControlKeysFalse_whenKeyIsNotprintableControl_printsKey() {


    }

    func test_printString() {


    }

    func test_mockTerminal() {
        let terminal = MockTerminal()
    }






}
