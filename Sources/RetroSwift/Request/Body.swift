import Foundation

@propertyWrapper struct Body<Value: Encodable> {
    var wrappedValue: Data?
    
    init(_ value: Value) {
        self.wrappedValue = try? JSONEncoder().encode(value)
    }
}
