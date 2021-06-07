// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "SafeLocalizedStringKey",
    products: [
        .executable(name: "SafeLocalizedStringKey", targets: ["SafeLocalizedStringKey"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser.git", from: "0.4.0")
    ],
    targets: [
        .target(
            name: "SafeLocalizedStringKey",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser")
            ]
        ),
        .testTarget(
            name: "SafeLocalizedStringKeyTests",
            dependencies: ["SafeLocalizedStringKey"]
        )
    ]
)
