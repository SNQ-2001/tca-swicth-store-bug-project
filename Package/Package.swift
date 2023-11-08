// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Package",
    platforms: [.iOS(.v16)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "AppFeature",
            targets: ["AppFeature"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-composable-architecture", from: "1.0.0"),
    ],
    targets: [
        // MARK: Target
        .target(name: "AppFeature", dependencies: [
            .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
            "Root",
        ]),
        .target(name: "Root", dependencies: [
            .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
            "Home",
            "SignIn",
        ]),
        .target(name: "Home", dependencies: [
            .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
            "Tab1",
        ]),
        .target(name: "SignIn", dependencies: [
            .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
        ]),
        .target(name: "Tab1", dependencies: [
            .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
            "Presentation1",
        ]),
        .target(name: "Presentation1", dependencies: [
            .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
            "Presentation2",
        ]),
        .target(name: "Presentation2", dependencies: [
            .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
        ]),
        
        // MARK: Test Target
        .testTarget(name: "PackageTests"),
    ]
)
