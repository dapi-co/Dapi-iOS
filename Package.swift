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
            url: "https://github.com/dapi-co/Dapi-iOS/releases/download/2.0.0/DapiSDK.zip",
            checksum: "456ccf6e6c9202f1b299ba18abb1795bf8c87528ae91bdfe07643a0bc1bfb845")
    ]
)
