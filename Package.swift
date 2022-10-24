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
            url: "https://github.com/dapi-co/Dapi-iOS/releases/download/1.1.0/DapiSDK.zip",
            checksum: "dcce4847b65a84884b4d189fe74ecb36c3c1ce8e70c783682801d31b0a2a21bb")
    ]
)
