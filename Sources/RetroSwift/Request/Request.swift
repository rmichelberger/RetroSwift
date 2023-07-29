import Foundation

@propertyWrapper
public struct Request {
    public private(set) var wrappedValue: URLRequest?
        
    public enum HTTPMethod: String {
        case GET, HEAD, PUT, POST, DELETE, CONNECT, OPTIONS, TRACE, PATCH
    }

    public init(baseURL: String,
         cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy,
         timeoutInterval: TimeInterval = 60.0,
         httpMethod: HTTPMethod = .GET,
         path: String? = nil,
         queries: [URLQueryItem]? = nil,
         body: Data? = nil,
         headers: [KeyValuePair<String, CustomStringConvertible?>]? = nil) {
        guard var urlComponents = URLComponents(string: baseURL) else {
            wrappedValue = nil
            return
        }
        if let path {
            urlComponents.path = path
        }
        urlComponents.queryItems = queries
        guard let url = urlComponents.url else {
            wrappedValue = nil
            return
        }
        wrappedValue = URLRequest(url: url)
        wrappedValue?.httpMethod = httpMethod.rawValue
        
        wrappedValue?.httpBody = body
        wrappedValue?.set(headers: headers)
    }
}
