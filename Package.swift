// swift-tools-version:5.7

/* Package.swift
 Version: 0.0.1

 Created by Mikhail Zhigulin in 7531.

 Copyright © 7531 - 7533 Mikhail A. Zhigulin of Novosibirsk

 The year starts from the creation of the world according to a Slavic calendar.
 September, the 1st of Slavic year.

 Licensed under the MIT license. See LICENSE file.
 All rights reserved.

 Abstract:
 Package manifest for an App component.
*/

import PackageDescription

let package = Package(
    name: "T3Component",
    platforms: [
        .macOS(.v10_13),
        .iOS(.v11)
    ],
    products: [
        .library(
            name: "T3Component",
            targets: ["T3Component"])
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "T3Component",
            dependencies: []),
        .testTarget(
            name: "T3ComponentTests",
            dependencies: ["T3Component"])
    ]
)
