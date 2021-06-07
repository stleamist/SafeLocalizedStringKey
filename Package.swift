// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "SafeLocalizedStringKey",
    products: [
        .executable(name: "SafeLocalizedStringKey", targets: ["SafeLocalizedStringKey"])
    ],
    dependencies: [],
    targets: [
        .target(
            name: "SafeLocalizedStringKey",
            dependencies: []
        ),
        .testTarget(
            name: "SafeLocalizedStringKeyTests",
            dependencies: ["SafeLocalizedStringKey"]
        )
    ]
)
