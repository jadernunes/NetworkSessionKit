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
    targets: [
        .target(
            name: "NetworkSessionKit"),
        .testTarget(
            name: "NetworkSessionKitTests",
            dependencies: ["NetworkSessionKit"]),
    ]
)
