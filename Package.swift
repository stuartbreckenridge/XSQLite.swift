// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "XSQLite.swift",
    platforms: [
        .iOS(.v11),
        .macOS(.v10_13),
        .watchOS(.v4),
        .tvOS(.v11)
    ],
    products: [
        .library(
            name: "XSQLite",
            targets: ["XSQLite"]
        )
    ],
    targets: [
        .target(
            name: "XSQLite",
            exclude: [
                "Info.plist"
            ]
        ),
        .testTarget(
            name: "XSQLiteTests",
            dependencies: [
                "XSQLite"
            ],
            path: "Tests/XSQLiteTests",
            exclude: [
                "Info.plist"
            ],
            resources: [
                .copy("Resources")
            ]
        )
    ]
)

#if os(Linux)
package.dependencies = [
    .package(url: "https://github.com/stephencelis/CXSQLite.git", from: "0.0.3")
]
package.targets.first?.dependencies += [
    .product(name: "CXSQLite", package: "CXSQLite")
]
#endif
