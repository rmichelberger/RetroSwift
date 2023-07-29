import Foundation

@propertyWrapper public struct Query<Value: CustomStringConvertible> {
    public var wrappedValue: URLQueryItem
    
    public init(wrappedValue: Value? = nil, name: String) {
        self.wrappedValue = URLQueryItem(name: name, value: wrappedValue?.description)
    }
}
