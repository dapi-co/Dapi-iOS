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
            url: "https://github.com/dapi-co/Dapi-iOS/releases/download/2.12.2/DapiSDK.zip",
            checksum: "ef01db2f35eaa5d25a835c363e5bbbfff401dede0bd479ce2a4bbde7585b23e0")
    ]
)
