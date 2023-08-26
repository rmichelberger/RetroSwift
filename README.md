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
### Request

You can create HTTP requests the following way.
First, you need to define the base URL as `String` and the HTTP method.

#### Basic request
Example:
```swift
let baseUrl = "https://example.com"
@GET(baseURL: baseUrl) var request
```

#### Path
You can also optionally define a `path`.
```swift
@Path(path: "/my/path") var path
```
You can also define dynamic parameters in the `path`.
Example:
```swift
let id = 123
@Path(path: "/api/v1/items/{id}", name: "id") var path = id
```
or
```swift
let id = "xyz"
@Path(path: "/api/v1/items/{parameter}", name: "parameter") var path = id
```
The parameter must implement the `CustomStringConvertible` protocol.

#### Query
```swift
@Query(key: "key") var query = 123
```
or
```swift
@Query(key: "key") var query = "value"
```
The `key` needs to be a `String`, and the value must implement the `CustomStringConvertible` protocol.

#### Body
```swift
@Body(value: value) var body
```
The `value` must implement the `Encodable` protocol.

You can also define your own `DataEncoder`, the default one is `JSONEncoder`.
```swift
@Body(value: value, encoder: encoder) var body
```

You can add the body to the HTTP request:
```swift
func getItem(id: Int) async throws -> Item {
    let baseUrl = "https://example.com"

    @Path(path: "/api/v1/items/{id}", name: "id") var path = id

    let user = ["Name": "John Doe"]
    @Body(value: user) var body
    @POST(baseURL: baseUrl, path: path, body: body) var request
    return try await retroSwift.execute(request: request)
}
```

### Header

You can specify the headers as following:

```swift
@Header(name: "Content-Type") var contentType = "application/json"
```

The `name` is the name of the header, and the value must conform the `CustomStringConvertible` protocol.


### Example Request

```swift
func getItem(id: Int) async throws -> Item {
    let client = ... // see below
    let baseUrl = "https://example.com"
    let retroSwift = RetroSwift(client: client)
    @Path(path: "/api/v1/items/{id}", name: "id") var path = id
    @Query(name: "fields") var fields = "id,title"
    @Query(name: "limit") var fields = 100
    @GET(baseURL: baseUrl, path: path, queries: [fields]) var request
    return try await retroSwift.execute(request: request)
}
```

This will generate following request:

`HTTP GET https://example.com/api/v1/items/14572?fields=id,title&limit=100`

Supported methods:
 HTTP Method | Signature
 --- | --- 
GET | `@GET(...)` 
PUT | `@PUT(...)`
POST | `@POST(...)`
DELETE | `@DELETE(...)`
OPTIONS | coming soon
TRACE | coming soon
PATCH | coming soon
CONNECT | coming soon
HEAD | coming soon

### HTTP client

You need to provide a HTTP client to `RetroSwift`.
This client must implement the `HTTPClient` protocol:

```swift
protocol HTTPClient {
    func execute<T: Decodable>(request: URLRequest) async throws -> T
}
```

It's recommended to use [OkHTTPClient](https://github.com/rmichelberger/OkHttpClient/) as the networking client.


## TODO

- [ ] Add dynamic parameter list to `@Path`.
- [ ] Add `Data` init to `@Body`.

Improve unit test coverage.

## Contributing

We always appreciate contributions from the community.
Please make sure to cover your changes with unit tests.

#
Inspired by [Retrofit](https://square.github.io/retrofit/).


