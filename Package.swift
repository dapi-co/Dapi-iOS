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
            url: "https://github.com/dapi-co/Dapi-iOS/releases/download/2.7.0/DapiSDK.zip",
            checksum: "d051e987b6470ba6a0093401a51e3127c46d9b80aaae29a93c5db02a0de60f90")
    ]
)
