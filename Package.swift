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
            url: "https://github.com/dapi-co/Dapi-iOS/releases/download/1.0.0-beta5/DapiSDK.zip",
            checksum: "c31d6846056960eda3c6e3e0e819cf2700daf118871d1333e9643c74b79a6aa7")
    ]
)
