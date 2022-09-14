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
            checksum: "7d704e8cf1589133cf055bdd5ad2a3f94fc39405cf7b0bab2c5542f2665e366c")
    ]
)
