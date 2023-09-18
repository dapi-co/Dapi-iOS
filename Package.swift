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
            url: "https://github.com/dapi-co/Dapi-iOS/releases/download/2.12.3/DapiSDK.zip",
            checksum: "c64d43d5adfb31cfcf9f47692030f3063a885202d1bdb9bfccf627ad30cba1eb")
    ]
)
