import Foundation

@propertyWrapper struct DELETE {
    var wrappedValue: Request
    
    init(baseURL: String,
         path: String? = nil,
         queries: [URLQueryItem]? = nil,
         headers: [HeaderType]? = nil) {
        wrappedValue = Request(baseURL: baseURL, httpMethod: .DELETE, path: path, queries: queries, headers: headers)
    }
}
