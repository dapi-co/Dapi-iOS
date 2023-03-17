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
            url: "https://github.com/dapi-co/Dapi-iOS/releases/download/2.8.0/DapiSDK.zip",
            checksum: "5cbcbf01843aa9fb1d603d37efb3c7fbf30f0e2a23f066fab4aa05761a2be2d7")
    ]
)
