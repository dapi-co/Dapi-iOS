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
            url: "https://github.com/dapi-co/Dapi-iOS/releases/download/2.6.0/DapiSDK.zip",
            checksum: "2e893dc01a5f461e51755f6d9ae1f3fcf7db69b09cc4a48bbb85cbea35c381c8")
    ]
)
