import Foundation

@propertyWrapper
public struct POST {
    public private(set) var wrappedValue: Request

    public init(baseURL: String,
         path: String? = nil,
         queries: [URLQueryItem]? = nil,
         body: Data? = nil,
         headers: [HeaderType]? = nil) {
        wrappedValue = Request(baseURL: baseURL, httpMethod: .POST , path: path, queries: queries, body: body, headers: headers)
    }
}
