// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "NeugelbImages",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "NeugelbImages",
            targets: ["NeugelbImages"])
    ],
    targets: [
        .target(
            name: "NeugelbImages",
            path: "./Sources",
            resources: [.process("Resources")]
        ),
        .testTarget(
            name: "NeugelbImagesTests",
            dependencies: ["NeugelbImages"]
        )
    ]
)
