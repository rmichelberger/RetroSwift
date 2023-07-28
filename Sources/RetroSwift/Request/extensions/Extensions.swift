import Foundation

extension URLRequest {    
    mutating func set(headers: [KeyValuePair<String, CustomStringConvertible?>]?) {
        headers?.forEach({ setValue($0.value?.description, forHTTPHeaderField: $0.key) })
    }
}
