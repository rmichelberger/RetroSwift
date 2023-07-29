import Foundation

final public class RetroSwift {
    public init() {}

    public func perform<T: Decodable>(request: Request) async throws -> T {
        try await perform(request: request.wrappedValue)
    }

    private func perform<T: Decodable>(request: URLRequest?) async throws -> T {
        guard let request else { throw URLError(.badURL) }
        let data = try await URLSession.shared.data(for: request).0
        return try JSONDecoder().decode(T.self, from: data)
    }
}

@available(iOS, deprecated: 15.0, message: "Use the built-in API instead")
public extension URLSession {
    func data(from url: URL) async throws -> (Data, URLResponse) {
        try await withCheckedThrowingContinuation { continuation in
            let task = dataTask(with: url) { data, response, error in
                guard let data = data, let response = response else {
                    let error = error ?? URLError(.badServerResponse)
                    return continuation.resume(throwing: error)
                }
                continuation.resume(returning: (data, response))
            }
            task.resume()
        }
    }
}
