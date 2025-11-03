// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "Leanplum",
    platforms: [
        .iOS(.v9)
    ],
    products: [
        .library(name: "Leanplum", targets: ["LeanplumTargetWrapper"]),
        .library(name: "LeanplumLocation", targets: ["LeanplumLocation"])
    ],
    dependencies: [
        .package(url: "https://github.com/CleverTap/clevertap-ios-sdk", from: "7.1.1")
    ],
    targets: [
        .target(
            name: "Leanplum",
            path: "Leanplum-SDK",
            exclude: [
                "LeanplumSDK_iOS-Info.plist",
                "LeanplumSDK_tvOS-Info.plist",
                // ✅ exclude Resources to avoid rebuilding storyboards already inside Leanplum.bundle
                "Resources"
            ],
            resources: [],
            publicHeadersPath: "include"
        ),
        .target(
            name: "LeanplumLocation",
            dependencies: ["Leanplum"],
            path: "LeanplumSDKLocation",
            exclude: [
                "LeanplumSDKLocation/LeanplumSDKLocation-Info.plist"
            ],
            resources: [
                .process("PrivacyInfo.xcprivacy")
            ],
            publicHeadersPath: "LeanplumSDKLocation/include"
        ),
        .target(
            name: "LeanplumTargetWrapper",
            dependencies: [
                "Leanplum",
                .product(name: "CleverTapSDK", package: "clevertap-ios-sdk")
            ],
            path: "LeanplumTargetWrapper"
        )
    ]
)
