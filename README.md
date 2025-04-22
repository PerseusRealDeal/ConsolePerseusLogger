# ConsolePerseusLogger — Xcode 14.2+

[`iOS approbation app`](https://github.com/perseusrealdeal/TheOneRing) [`macOS approbation app`](https://github.com/perseusrealdeal/Arkenstone)

> Light-weight logger in Swift. Hereinafter `CPL` stands for `Console Perseus Logger`.<br/>
> Tutorial [`Mastering Logging with CPL`](https://docs.google.com/document/d/1cWsqhRphP9NzGbMxkJA1agLProjPn6GBw3QEaar4VNY/edit?usp=sharing).<br/>

> `CPL` is a single author and personale solution developed in `person-to-person` relationship paradigm.

[![Actions Status](https://github.com/perseusrealdeal/ConsolePerseusLogger/actions/workflows/main.yml/badge.svg)](https://github.com/perseusrealdeal/ConsolePerseusLogger/actions/workflows/main.yml)
[![Style](https://github.com/perseusrealdeal/ConsolePerseusLogger/actions/workflows/swiftlint.yml/badge.svg)](https://github.com/perseusrealdeal/ConsolePerseusLogger/actions/workflows/swiftlint.yml)
[![Version](https://img.shields.io/badge/Version-1.1.0-green.svg)](/CHANGELOG.md)
[![Platforms](https://img.shields.io/badge/Platforms-macOS%2010.13+_|_iOS%2011.0+-orange.svg)](https://en.wikipedia.org/wiki/List_of_Apple_products)
[![Xcode 14.2](https://img.shields.io/badge/Xcode-14.2+-red.svg)](https://en.wikipedia.org/wiki/Xcode)
[![Swift 5.7](https://img.shields.io/badge/Swift-5.7-red.svg)](https://www.swift.org)
[![License](http://img.shields.io/:License-MIT-blue.svg)](/LICENSE)

## Integration Capabilities

[![Standalone](https://img.shields.io/badge/Standalone%20-available-informational.svg)](/CPLStar.swift)
[![Swift Package Manager compatible](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-4BC51D.svg)](/Package.swift)

> Use Stars to adopt [`CPL`](/CPLStar.swift) for the specifics you need.

## Approbation Matrix

> [`A3 Environment and Approbation`](/APPROBATION.md) / [`CHANGELOG`](/CHANGELOG.md) for details.

## In brief > Idea to use, the Why

> USE LOGGER LIKE A VARIABLE ANYWHERE YOU WANT.<br/>

![Image](https://github.com/user-attachments/assets/4d3ecb2c-973c-41f1-80d9-c0fa236ff325)

## Build requirements

- [macOS Monterey 12.7.6+](https://apps.apple.com/by/app/macos-monterey/id1576738294) / [Xcode 14.2+](https://developer.apple.com/services-account/download?path=/Developer_Tools/Xcode_14.2/Xcode_14.2.xip)

> But as the single source code file [CPLStar.swift](/CPLStar.swift) CPL can be used even in Xcode 10.1.

## Third-party software

- Style [SwiftLint](https://github.com/realm/SwiftLint) / [Shell Script](/SucceedsPostAction.sh)
- Action [mxcl/xcodebuild@v3.3](https://github.com/mxcl/xcodebuild/releases/tag/v3.3.0)
- Action [cirruslabs/swiftlint-action@v1](https://github.com/cirruslabs/swiftlint-action/releases/tag/v1.0.0)

# Installation

> Standalone: the single source code file [CPLStar.swift](/CPLStar.swift)

> Swift Package Manager: `https://github.com/perseusrealdeal/ConsolePerseusLogger`

# Usage

## Log to console

```swift

import ConsolePerseusLogger // Or use standalone CPLStar.swift

log.message("[\(type(of: self))].\(#function)")

```

![Image](https://github.com/user-attachments/assets/b6049e5a-a84c-4762-a103-cf85fc8d8b52)

## Log to Mac Console

```swift

import ConsolePerseusLogger // Or use standalone CPLStar.swift

// MARK: - Log to Mac Console

// log.logObject = ("MyApp", "MyLogger") // Customs for Mac Console Subsystem and Category.

log.output = .consoleapp
log.message("The app's start point...", .info)

```

![Image](https://github.com/user-attachments/assets/ac711ff0-4296-406c-90ba-630149dda39c)

## Log level and message types

> CPL applies the most common log types for indicating information category.

| Level | Message Type | Description                           |
| :---: | :----------- | :------------------------------------ |
| 5     | DEBUG        | Debugging only                        |
| 4     | INFO         | Helpful, but not essential            |
| 3     | NOTICE       | Might result in a failure             |
| 2     | ERROR        | Errors seen during the code execution |
| 1     | FAULT        | Faults and bugs in the code           |

> More over CPL considers each type like a message filter look how it works

![Image](https://github.com/user-attachments/assets/69ee1f63-a58d-414a-9cc8-fe1673a15982)

## Setup the Logger for Work

> Default values of CPL options depend on DEBUG/RELEASE.

| Options     | Default in DEBUG | Default in RELEASE |
| :---------- | :--------------- | :----------------- |
| tuned       | .on              | .off               |
| output      | .xcodedebug      | .consoleapp        |
| level       | .debug           | .notice            |

> Other CPL options are the same for DEBUG/RELEASE by default. 

| Options     | Default in DEBUG      | Default in RELEASE    |
| :---------- | :-------------------- | :-------------------- |
| subsecond   | .nanosecond           | .nanosecond           |
| format      | .short                | .short                |
| marks       | true                  | true                  |
| time        | false                 | false                 |
| directives  | false                 | false                 |
| logObject   | ("Perseus", "Logger") | ("Perseus", "Logger") |

> Special option goes kinda lifehack. Matter only if Simulator. 

| Options     | Default in DEBUG | Default in RELEASE |
| :---------- | :--------------- | :----------------- |
| debugIsInfo | true             | true               |

## CPL in SPM package

> In case if CPL in use as a standalone file in SPM package.

```swift

//
//  main.swift
//

import ConsolePerseusLogger // Or use standalone CPLStar.swift

import class PackageA.PerseusLogger
import class PackageB.PerseusLogger

typealias logA = PackageA.PerseusLogger
typealias logB = PackageB.PerseusLogger

// MARK: - Subloggers

logA.turned = .off
logB.turned = .off

// MARK: - Logger

log.message("The app's start point...", .info)

```

## Console on Mac and Simulator

> Just a matter of fact that Console on Mac doesn't show any DEBUG message from any app running on Simulator ("Include Debug Messages" tapped).<br/>

> Console Perseus Logger running on Simulator doesn't pass DEBUG message, instead it passes INFO message with text of DEBUG message, so, a passed message being INFO looks like a DEBUG and it works perfactly well.<br/>

> If for some reasons Simulator must pass DEBUG like a DEBUG message there is an option exists (it's true by default if Simulator):

```swift

#if targetEnvironment(simulator)
    log.debugIsInfo = false // Use Case: Mac Console in use to redirect logs to file on disk.
#endif

```

# Points taken into account

- Preconfigured Swift Package manifest [Package.swift](/Package.swift)
- Preconfigured SwiftLint config [.swiftlint.yml](/.swiftlint.yml)
- Preconfigured SwiftLint CI [swiftlint.yml](/.github/workflows/swiftlint.yml)
- Preconfigured GitHub config [.gitignore](/.gitignore)
- Preconfigured GitHub CI [main.yml](/.github/workflows/main.yml)

# License MIT

Copyright © 7531 - 7533 Mikhail A. Zhigulin of Novosibirsk<br/>
Copyright © 7531 - 7533 PerseusRealDeal

- The year starts from the creation of the world according to a Slavic calendar.
- September, the 1st of Slavic year. It means that "Sep 01, 2024" is the beginning of 7533.

[LICENSE](/LICENSE) for details.

## Credits

<table>
<tr>
    <td>Balance and Control</td>
    <td>kept by</td>
    <td>Mikhail A. Zhigulin</td>
</tr>
<tr>
    <td>Source Code</td>
    <td>written by</td>
    <td>Mikhail A. Zhigulin</td>
</tr>
<tr>
    <td>Documentation</td>
    <td>prepared by</td>
    <td>Mikhail A. Zhigulin</td>
</tr>
<tr>
    <td>Product Approbation</td>
    <td>tested by</td>
    <td>Mikhail A. Zhigulin</td>
</tr>
</table>

- Language support: [Reverso](https://www.reverso.net/)
- Git clients: [SmartGit](https://syntevo.com/) and [GitHub Desktop](https://github.com/apps/desktop)

# Author

> Mikhail A. Zhigulin of Novosibirsk.
