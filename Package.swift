// swift-tools-version: 5.10.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "9472-Team01_Swift_FinalProject",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "9472-Team01_Swift_FinalProject",
            targets: ["9472-Team01_Swift_FinalProject"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "9472-Team01_Swift_FinalProject"),
        .testTarget(
            name: "9472-Team01_Swift_FinalProjectTests",
            dependencies: ["9472-Team01_Swift_FinalProject"]
        ),
    ]
)
