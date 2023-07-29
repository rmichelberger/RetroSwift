import Foundation

@propertyWrapper
public struct Body<Value: Encodable> {
    public private(set) var wrappedValue: Data?
    
    public init(_ value: Value) {
        self.wrappedValue = try? JSONEncoder().encode(value)
    }
}
