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
            url: "https://github.com/dapi-co/Dapi-iOS/releases/download/1.0.0-beta4/DapiSDK.zip",
            checksum: "367c4d5def852b1600d6e8a9ff45ea2709bcee936cf7c0e72f6513add8ae7bd4")
    ]
)
