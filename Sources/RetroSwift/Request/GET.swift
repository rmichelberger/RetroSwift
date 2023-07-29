import Foundation

@propertyWrapper public struct GET {
    public var wrappedValue: Request
    
    public init(baseURL: String,
         path: String? = nil,
         queries: [URLQueryItem]? = nil,
         headers: [HeaderType]? = nil) {
        wrappedValue = Request(baseURL: baseURL, path: path, queries: queries, headers: headers)
    }
}
