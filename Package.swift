// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "FormFieldKit",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "FormFieldKit",
            targets: ["FormFieldKit"]
        ),
    ],
    targets: [
        .target(
            name: "FormFieldKit",
            dependencies: []
        ),
        .testTarget(
            name: "FormFieldKitTests",
            dependencies: ["FormFieldKit"]
        ),
    ]
)
