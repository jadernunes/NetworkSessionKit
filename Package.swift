// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NetworkSessionKit",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v14),
    ],
    products: [
        .library(
            name: "NetworkSessionKit",
            targets: ["NetworkSessionKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.8.1"),
        .package(url: "https://github.com/jadernunes/LocalizeKit.git", from: "1.0.1"),
        .package(url: "https://github.com/jadernunes/SwiftUtilsKit.git", from: "1.2.4")
    ],
    targets: [
        .target(
            name: "NetworkSessionKit",
            dependencies: ["LocalizeKit", "Alamofire", "SwiftUtilsKit"]),
        .testTarget(
            name: "NetworkSessionKitTests",
            dependencies: ["NetworkSessionKit"]),
    ]
)
