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
            url: "https://github.com/dapi-co/Dapi-iOS/releases/download/2.11.0/DapiSDK.zip",
            checksum: "795dfc5dcc415b35785999400ec1f2f8436db631df3e3fddb76f9673579548b6")
    ]
)
