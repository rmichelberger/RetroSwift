import Foundation

@propertyWrapper public struct PUT {
    public var wrappedValue: Request

    public init(baseURL: String,
         path: String? = nil,
         queries: [URLQueryItem]? = nil,
         body: Data? = nil,
         headers: [HeaderType]? = nil) {
        wrappedValue = Request(baseURL: baseURL, httpMethod: .PUT , path: path, queries: queries, body: body, headers: headers)
    }
}
