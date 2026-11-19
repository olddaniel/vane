import XCTest
@testable import vane

/// A site's own copy confirmation is accepted without a sheet. Other confirm boxes still show.
final class CopyConfirmationTests: XCTestCase {
    func testSiteCopyConfirmationIsRecognised() {
        XCTAssertTrue(isSiteCopyConfirmation(
            "Are you sure you want to copy the following text to your clipboard?\n\nDiscovery"))
    }

    func testOtherConfirmationsStillShow() {
        XCTAssertFalse(isSiteCopyConfirmation("Are you sure you want to delete this task?"))
        XCTAssertFalse(isSiteCopyConfirmation("Discard unsaved changes?"))
        XCTAssertFalse(isSiteCopyConfirmation("Copy this text to your clipboard?"),
                       "Only the exact confirmation wording is accepted")
    }
}
