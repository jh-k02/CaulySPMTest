// swift-tools-version: 5.8
// 3.1.28
import PackageDescription

let package = Package(
    name: "CaulySPMTest",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        // 외부에 노출되는 제품은 래퍼 타깃을 노출
        .library(
            name: "CaulySDK",
            targets: ["CaulySDKWrapper"]
        )
    ],
    targets: [
        // 1) 실제 바이너리
        .binaryTarget(
            name: "CaulySDK",
            path: "CaulySDK.xcframework"
        ),

        // 2) 래퍼 타깃: 링크 설정을 강제
        .target(
            name: "CaulySDKWrapper",
            dependencies: [
                .target(name: "CaulySDK")
            ],
            linkerSettings: [
                // Required
                .linkedFramework("AVKit"),
                .linkedFramework("UIKit"),
                .linkedFramework("Foundation"),
                .linkedFramework("CoreGraphics"),
                .linkedFramework("QuartzCore"),
                .linkedFramework("SystemConfiguration"),
                .linkedFramework("MediaPlayer"),
                .linkedFramework("CFNetwork"),
                .linkedFramework("EventKit"),
                .linkedFramework("AdSupport"),
                .linkedFramework("MessageUI",),
            ]
        )
    ]
)
