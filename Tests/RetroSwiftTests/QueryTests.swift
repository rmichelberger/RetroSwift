import XCTest
@testable import RetroSwift

final class QueryTests: XCTestCase {
    
    func test_nilValue() throws {
        @Query<String>(name: "query") var query
        XCTAssertNil(query.value)
        XCTAssertEqual(query.name, "query")
    }

    func test_stringValue() throws {
        @Query(name: "query") var query = "query"
        XCTAssertEqual(query.value, "query")
        XCTAssertEqual(query.name, "query")
    }

    func test_intValue() throws {
        @Query(name: "query") var query = 1
        XCTAssertEqual(query.value, "1")
        XCTAssertEqual(query.name, "query")
    }

}
