# RetroSwift

[![SwiftPM](https://img.shields.io/badge/SPM-supported-DE5C43.svg?style=flat)](https://swift.org/package-manager/) [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A leightweigth REST API request generator library for Swift.

## Installing RetroSwift
RetroSwift supports [Swift Package Manager](https://www.swift.org/package-manager/).

### Swift Package Manager

To install RetroSwift using [Swift Package Manager](https://github.com/apple/swift-package-manager) you can follow the [tutorial published by Apple](https://developer.apple.com/documentation/xcode/adding_package_dependencies_to_your_app) using the URL for the RetroSwift repo with the current version:

1. In Xcode, select “File” → “Add Packages...”
1. Enter https://github.com/rmichelberger/RetroSwift

or you can add the following dependency to your `Package.swift`:

```swift
.package(url: "https://github.com/rmichelberger/RetroSwift/", from: "1.0.0")
```

## Usage

```swift
private let baseUrl = "https://example.com"

func getItem(id: Int) async throws -> Item {
    @Path(path: "/api/v1/items/{id}", name: "id") var path = id
    @Query(name: "fields") var fields = "id,title"
    @GET(baseURL: baseUrl, path: path, queries: [fields]) var request

    guard let urlRequest = request.wrappedValue else { throw URLError(.badURL) }
    let result = try await URLSession.shared.data(for: urlRequest)
    let data = result.0
    return try JSONDecoder().decode(Items.self, from: data)
}

```

Inspired by [Retrofit](https://square.github.io/retrofit/).


