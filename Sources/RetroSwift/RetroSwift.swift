import Foundation

final public class RetroSwift {
    private let client: HTTPClient
    
    public init(client: HTTPClient) {
        self.client = client
    }
    
    public func execute<T: Decodable>(request: Request) async throws -> T {
        guard let request = request.wrappedValue else { throw URLError(.badURL) }
        return try await client.execute(request: request)
    }
}
