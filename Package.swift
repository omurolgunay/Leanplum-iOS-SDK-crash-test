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
        .package(url: "https://github.com/CleverTap/clevertap-ios-sdk", from: "7.1.1"),
        .package(url: "https://github.com/omurolgunay/Leanplum-iOS-SDK-crash-test.git", branch: "master")
    ],
    targets: [
        .target(
            name: "LeanplumLocation",
            dependencies: [
                .product(name: "Leanplum", package: "Leanplum")
            ],
            path: "LeanplumSDKLocation",
            resources: [
                .copy("LeanplumSDKLocation/PrivacyInfo.xcprivacy")
            ],
            publicHeadersPath: "LeanplumSDKLocation/include"
        ),
        .target(
            name: "LeanplumTargetWrapper",
            dependencies: [
                .product(name: "Leanplum", package: "Leanplum"),
                .product(name: "CleverTapSDK", package: "clevertap-ios-sdk")
            ],
            path: "LeanplumTargetWrapper"
        )
    ]
)
