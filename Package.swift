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
            url: "https://github.com/dapi-co/Dapi-iOS/releases/download/2.9.1/DapiSDK.zip",
            checksum: "7ad1ddf05bf4fb2fc99149591d1e5fdaffffc5402729c62e6d48aa667d422a51")
    ]
)
