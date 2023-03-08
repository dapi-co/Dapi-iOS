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
            url: "https://github.com/dapi-co/Dapi-iOS/releases/download/2.5.0/DapiSDK.zip",
            checksum: "ebafa4c8856e4bfec20662375aa4a5ccf0e9d8d8ca5e60146f4d643b6a2a6e05")
    ]
)
