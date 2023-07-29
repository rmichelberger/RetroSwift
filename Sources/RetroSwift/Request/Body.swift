import Foundation

@propertyWrapper
public struct Body<Value: Encodable> {
    public private(set) var wrappedValue: Data?
    
    public init(_ value: Value, encoder: DataEncoder = JSONEncoder()) {
        self.wrappedValue = try? encoder.encode(value)
    }
}

extension JSONEncoder: DataEncoder {}
