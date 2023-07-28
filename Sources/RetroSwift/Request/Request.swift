import Foundation

@propertyWrapper struct Request {
    var wrappedValue: URLRequest
        
    enum HTTPMethod: String {
        case GET, HEAD, PUT, POST, DELETE, CONNECT, OPTIONS, TRACE, PATCH
    }

    init(baseURL: String,
         cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy,
         timeoutInterval: TimeInterval = 60.0,
         httpMethod: HTTPMethod = .GET,
         path: String? = nil,
         queries: [URLQueryItem]? = nil,
         body: Data? = nil,
         headers: [KeyValuePair<String, CustomStringConvertible?>]? = nil) {
        var urlComponents = URLComponents(string: baseURL)!
        if let path {
            urlComponents.path = path
        }
        urlComponents.queryItems = queries
        let url = urlComponents.url!
        wrappedValue = URLRequest(url: url)
        wrappedValue.httpMethod = httpMethod.rawValue
        
        wrappedValue.httpBody = body
        wrappedValue.set(headers: headers)
    }
}
