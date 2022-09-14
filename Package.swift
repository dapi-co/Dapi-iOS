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
            checksum: "6a398f517c85590b86fd21c2fc4e336142c65f66ad7b5c582b4b0a56a3ec50b5")
    ]
)
