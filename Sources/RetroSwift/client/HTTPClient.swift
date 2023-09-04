import Foundation

public protocol HTTPClient {
    func execute<T: Decodable>(request: URLRequest) async throws -> T
}
