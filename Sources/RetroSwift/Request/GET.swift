import Foundation

@propertyWrapper struct GET {
    var wrappedValue: Request
    
    init(baseURL: String,
         path: String? = nil,
         queries: [URLQueryItem]? = nil,
         headers: [HeaderType]? = nil) {
        wrappedValue = Request(baseURL: baseURL, path: path, queries: queries, headers: headers)
    }
}
