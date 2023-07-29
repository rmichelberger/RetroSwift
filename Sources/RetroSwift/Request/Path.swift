@propertyWrapper
public struct Path {
    public private(set) var wrappedValue: String
    
    public init(wrappedValue: CustomStringConvertible? = nil, path: String, name: String? = nil) {
        if let name, let value = wrappedValue?.description {
            self.wrappedValue = path.replacingOccurrences(of: "{\(name)}", with: value)
        } else {
            self.wrappedValue = path
        }
    }
}
