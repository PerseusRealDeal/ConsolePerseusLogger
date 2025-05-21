// swift-tools-version:5.7

/* Package.swift
 Version: 1.3.0

 For iOS and macOS only. Use Stars to adopt for the specifics you need.

 Created by Mikhail Zhigulin in 7533.

 Copyright © 7531 - 7533 Mikhail A. Zhigulin of Novosibirsk
 Copyright © 7531 - 7533 PerseusRealDeal

 The year starts from the creation of the world according to a Slavic calendar.
 September, the 1st of Slavic year.

 Licensed under the MIT license. See LICENSE file.
 All rights reserved.

 Abstract:
 Package manifest for ConsolePerseusLogger.
*/

import PackageDescription

let package = Package(
    name: "ConsolePerseusLogger",
    platforms: [
        .macOS(.v10_13),
        .iOS(.v11)
    ],
    products: [
        .library(
            name: "ConsolePerseusLogger",
            targets: ["ConsolePerseusLogger"])
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "ConsolePerseusLogger",
            dependencies: []),
        .testTarget(
            name: "UnitTests",
            dependencies: ["ConsolePerseusLogger"])
    ]
)
