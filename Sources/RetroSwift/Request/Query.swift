import Foundation

@propertyWrapper struct Query<Value: CustomStringConvertible> {
    var wrappedValue: URLQueryItem
    
    init(wrappedValue: Value? = nil, name: String) {
        self.wrappedValue = URLQueryItem(name: name, value: wrappedValue?.description)
    }
}
