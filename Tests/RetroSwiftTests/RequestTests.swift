import XCTest
@testable import RetroSwift

final class RequestTests: XCTestCase {
    
    func test_request() throws {
        @Query(name: "query") var query = "$ `&=@"
        @Query(name: "escaped") var escaped = "$ `&=@"
        @Header(name: "Header") var header = "Header"
        @Path(path: "asdf$\n_#") var path
        struct Dummy: Encodable {
            let s: String
            let i: Int
        }
        let dummy = Dummy(s: "😎", i: -1)
        @Body(dummy) var body
        @Request(baseURL: "",
                 httpMethod: .CONNECT,
                 path: path,
                 queries: [query, escaped],
                 body: body,
                 headers: [header]) var request
        XCTAssertEqual("asdf$%0A_%23?query=$%20%60%26%3D@&escaped=$%20%60%26%3D@", request?.url?.absoluteString)
        XCTAssertEqual("CONNECT", request?.httpMethod)
        XCTAssertEqual(request?.httpBody, "{\"s\":\"😎\",\"i\":-1}".data(using: .utf8))
    }
}
