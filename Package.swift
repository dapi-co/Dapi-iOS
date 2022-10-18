// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DapiSDK",
    products: [
        .library(
            name: "DapiSDK",
            targets: ["DapiSDK"])
    ],
    targets: [
        .binaryTarget(
            name: "DapiSDK",
            url: "https://github.com/dapi-co/Dapi-iOS/releases/download/1.0.0/DapiSDK.zip",
            checksum: "2a14c4bf4990c587987d7166157b9d87f38e738ecbc0d5ccaef72a793b2ea59e")
    ]
)
