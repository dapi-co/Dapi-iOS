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
            url: "https://github.com/dapi-co/Dapi-iOS/releases/download/2.14.0/DapiSDK.zip",
            checksum: "a7317a1eb72ce0f13ac34ae6e46c42d6c20a60e03993900d8c83836451d0e99d")
    ]
)
