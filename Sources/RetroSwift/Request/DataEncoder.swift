import Foundation

public protocol DataEncoder {
    func encode<T>(_ value: T) throws -> Data where T : Encodable
}
