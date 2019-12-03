// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AppBottomActionSheet",
	platforms: [.iOS(.v10)],
    products: [
        .library(name: "AppBottomActionSheet", targets: ["AppBottomActionSheet"]),
    ],
    targets: [
        .target(name: "AppBottomActionSheet", dependencies: []),
        .testTarget(name: "AppBottomActionSheetTests", dependencies: ["AppBottomActionSheet"]),
    ],
	swiftLanguageVersions: [.v4_2]
)
