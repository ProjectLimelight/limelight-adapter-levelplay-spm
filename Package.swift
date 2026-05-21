// swift-tools-version:5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LimelightSDKLevelPlayAdapter",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v12),
    ],
    products: [
        .library(
            name: "LimelightSDKLevelPlayAdapter",
            targets: ["LimelightSDKLevelPlayAdapterResources"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/Limelight/limelight-sdk-spm.git", .upToNextMajor(from: "0.1.0")),
    ],
    targets: [
        .binaryTarget(
            name: "LimelightSDKLevelPlayAdapter",
            url: "https://limelight-sdk.s3.amazonaws.com/iOS/LimelightSDKLevelPlayAdapter/0.1.2/LimelightSDKLevelPlayAdapter.xcframework.zip",
            checksum: "bbb65bde75f46dc9d895211c94e0d1ca82084f56bf78f4006fe76e03190aca3c"
        ),
        .binaryTarget(
            name: "IronSource",
            url: "https://github.com/ironsource-mobile/iOS-sdk/releases/download/IronSource_9.4.1/IronSource9.4.1.zip",
            checksum: "bbf6c7fa509a346ca126082a711ff30eeebfa0b557098d2b5c1e470f40626fe7"
        ),
        .target(
            name: "LimelightSDKLevelPlayAdapterResources",
            dependencies: [
                .target(name: "LimelightSDKLevelPlayAdapter"),
                .product(name: "LimelightSDK", package: "limelight-sdk-spm"),
                .target(name: "IronSource"),
            ]
        ),
    ]
)
