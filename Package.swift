// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.


import PackageDescription

let package = Package(
    name: "Networking1",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "Networking1",
            targets: ["Networking1"]),
    ],
    targets: [
        .target(
            name: "Networking1"),

    ]
)

