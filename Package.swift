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
            url: "https://github.com/dapi-co/Dapi-iOS/releases/download/1.0.0-beta/DapiSDK.zip",
            checksum: "d01a5d3e62457f6641c126707125b4984e058aa3fb06fdc1ea9d5d1445f5d20d")
    ]
)
