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
            url: "https://github.com/dapi-co/Dapi-iOS/releases/download/2.0.1/DapiSDK.zip",
            checksum: "d03b16c63a9dfba6bfbda3d378f14993303ff023cac5dfdf46ed13664a8c09e0")
    ]
)
