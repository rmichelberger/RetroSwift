typealias HeaderType = KeyValuePair<String, CustomStringConvertible?>

@propertyWrapper struct Header<Value: CustomStringConvertible> {
    var wrappedValue: HeaderType
    
    init(wrappedValue: Value? = nil, name: String) {
        self.wrappedValue = HeaderType(key: name, value: wrappedValue)
    }
}
