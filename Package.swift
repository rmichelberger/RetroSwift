// swift-tools-version: 5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RetroSwift",
    platforms: [.macOS(.v10_14), .iOS(.v11), .tvOS(.v11), .watchOS(.v8)],
    products: [.library(name: "RetroSwift", targets: ["RetroSwift"]),],
    targets: [
        .target(name: "RetroSwift"),
        .testTarget(
            name: "RetroSwiftTests",
            dependencies: ["RetroSwift"]),
    ]
)
