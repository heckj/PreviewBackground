#if !os(watchOS) // no XCTest provider in .watchOS (as of v6/IOS 10.13)
    @testable import PreviewBackground
    import SwiftUI
    import XCTest

    final class PreviewBackgroundTests: XCTestCase {
        func test_PreviewBackground_init() throws {
            XCTAssertNotNil(PreviewBackground(content: {
                Text("hi")
        }))
        }
    }
#endif
