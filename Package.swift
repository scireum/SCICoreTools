// swift-tools-version:5.9

import PackageDescription

let package = Package(
    name: "SCICoreTools",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(name: "SCICoreTools", targets: ["SCICoreTools"])
    ],
    targets: [
        .target(
            name: "SCICoreTools",
            path: "SCICoreTools",
            // only needed by the CocoaPods / Xcode framework build
            exclude: ["SCICoreTools.h", "Info.plist"]
        )
    ],
    swiftLanguageVersions: [.v5]
)
