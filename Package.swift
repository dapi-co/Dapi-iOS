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
            url: "https://github.com/dapi-co/Dapi-iOS/releases/download/2.9.0/DapiSDK.zip",
            checksum: "72cfd922a21028d4b3da2c3f0bc85ada1cd5a55ccb0732ce57a5b482316325ae")
    ]
)
