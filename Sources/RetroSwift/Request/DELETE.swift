import Foundation

@propertyWrapper
public struct DELETE {
    public private(set) var wrappedValue: Request
    
    public init(baseURL: String,
         path: String? = nil,
         queries: [URLQueryItem]? = nil,
         headers: [HeaderType]? = nil) {
        wrappedValue = Request(baseURL: baseURL, httpMethod: .DELETE, path: path, queries: queries, headers: headers)
    }
}
