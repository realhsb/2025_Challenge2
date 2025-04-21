// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "FourStars",
    platforms: [
        .iOS(.v17),
        .macOS(.v14)
    ],
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-composable-architecture.git", from: "1.0.0")
    ],
    targets: [
        .target(
            name: "FourStars",
            dependencies: [
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
            ]
        )
    ]
) 