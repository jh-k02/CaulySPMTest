// swift-tools-version: 5.8
// 3.1.24
import PackageDescription

let package = Package(
    name: "CaulySPMTest",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(
            name: "CaulySDK",
            targets: ["CaulySDK"]
        )
    ],
    targets: [
        .binaryTarget(
            name: "CaulySDK",
            path: "CaulySDK.xcframework"
        )
    ]
)
