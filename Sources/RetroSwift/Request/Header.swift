public typealias HeaderType = KeyValuePair<String, CustomStringConvertible?>

@propertyWrapper
public struct Header<Value: CustomStringConvertible> {
    public private(set) var wrappedValue: HeaderType
    
    public init(wrappedValue: Value? = nil, name: String) {
        self.wrappedValue = HeaderType(key: name, value: wrappedValue)
    }
}
