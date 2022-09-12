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
            url: "https://github.com/dapi-co/Dapi-iOS/releases/download/3.0.0/DapiSDK.zip",
            checksum: "b48b0a4da1ca23edeb3a18e5bc0b0a279fc811901478b0b1f7f6fe9c6b5f6c4b")
    ]
)
