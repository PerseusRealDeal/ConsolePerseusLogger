# ConsolePerseusLogger — Xcode 14.2+

> [`iOS approbation app`](https://github.com/perseusrealdeal/TheOneRing) [`macOS approbation app`](https://github.com/perseusrealdeal/Arkenstone)

> Light-weight logging lover in Swift. Hereinafter `CPL` stands for `C`onsole `P`erseus `L`ogger.<br/>

> - Log to the console.<br/>
> - Log to macOS Console.app.<br/>
> - Log to custom output.

> `[TYPE] [DATE] [TIME] [PID:TID] message, file: #, line: #`

> `CPL` is a single author and personale solution developed in `person-to-person` relationship paradigm.

[![Actions Status](https://github.com/perseusrealdeal/ConsolePerseusLogger/actions/workflows/main.yml/badge.svg)](https://github.com/perseusrealdeal/ConsolePerseusLogger/actions/workflows/main.yml)
[![Style](https://github.com/perseusrealdeal/ConsolePerseusLogger/actions/workflows/swiftlint.yml/badge.svg)](https://github.com/perseusrealdeal/ConsolePerseusLogger/actions/workflows/swiftlint.yml)
[![Version](https://img.shields.io/badge/Version-1.5.1-green.svg)](/CHANGELOG.md)
[![Platforms](https://img.shields.io/badge/Platforms-macOS%2010.13+_|_iOS%2011.0+-orange.svg)](https://en.wikipedia.org/wiki/List_of_Apple_products)
[![Xcode 14.2](https://img.shields.io/badge/Xcode-14.2+-red.svg)](https://en.wikipedia.org/wiki/Xcode)
[![Swift 5.7](https://img.shields.io/badge/Swift-5.7-red.svg)](https://www.swift.org)
[![License](http://img.shields.io/:License-MIT-blue.svg)](/LICENSE)

## Integration Capabilities

[![Standalone](https://img.shields.io/badge/Standalone%20-available-informational.svg)](/CPLStar.swift)
[![Swift Package Manager compatible](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-4BC51D.svg)](/Package.swift)

> [!TIP]
> To adopt `CPL` for the specifics you need use [Standalone](/CPLStar.swift).

## Approbation Matrix

> [`A3 Environment and Approbation`](/APPROBATION.md) / [`CHANGELOG`](/CHANGELOG.md) for details.

> Xcode playground [download page](https://github.com/PerseusRealDeal/ConsolePerseusLogger/issues/17).

## In brief > Idea to use

> USE LOGGER LIKE A VARIABLE ANYWHERE YOU WANT.<br/>

![Image](https://github.com/user-attachments/assets/d1bb43ab-1342-4dff-b4d4-0fbd205dba39)

## Build requirements

- [macOS Monterey 12.7.6+](https://apps.apple.com/by/app/macos-monterey/id1576738294) / [Xcode 14.2+](https://developer.apple.com/services-account/download?path=/Developer_Tools/Xcode_14.2/Xcode_14.2.xip)

> [!TIP]
> As the single source code [CPLStar.swift](/CPLStar.swift) CPL with minimum changes can be used even in Xcode 10.1, just remove all statements starting with `if #available(iOS 14.0, macOS 11.0, *)`.

## Third-party software

| Type   | Name                                                                                                                              | License                            |
| ------ | --------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------- |
| Style  | [SwiftLint](https://github.com/realm/SwiftLint) / [v0.57.0 for Monterey+](https://github.com/realm/SwiftLint/releases/tag/0.57.0) | MIT                                |
| Script | [SwiftLint Shell Script](/SucceedsPostAction.sh) to run SwiftLint                                                                 | MIT                                |
| Action | [mxcl/xcodebuild@v3](https://github.com/mxcl/xcodebuild)                                                                          | [Unlicense](https://unlicense.org) |
| Action | [cirruslabs/swiftlint-action@v1](https://github.com/cirruslabs/swiftlint-action/)                                                 | MIT                                |

# Installation

> Standalone: the single source code file [CPLStar.swift](/CPLStar.swift)

> Swift Package Manager: `https://github.com/perseusrealdeal/ConsolePerseusLogger`

> [!NOTE]
> If output is consoleapp and Environment Variable `OS_ACTIVITY_MODE` in `disable` log messaging will be restricted for Xcode console, but only.

![Image](https://github.com/user-attachments/assets/fb64c5cf-70dc-489c-9850-976ea3d5800c)

# Usage

## Log to the console

```swift

import ConsolePerseusLogger

log.message("[\(type(of: self))].\(#function)")

```

![Image](https://github.com/user-attachments/assets/fde70234-5faa-4afe-ad1f-2bfc24ee8f7d)

## Log to macOS Console.app

```swift

import ConsolePerseusLogger

// MARK: - Log to Console.app

// log.logObject = ("MyApp", "MyLover") // Customs for Console.app Subsystem and Category.

log.output = .consoleapp
log.message("The app's start point...", .info)

```

![Image](https://github.com/user-attachments/assets/04e2618f-7b83-401a-bc7b-87bdc91fb9e9)

## Custom log

```swift

import ConsolePerseusLogger

typealias Level = ConsolePerseusLogger.PerseusLogger.Level

func customPrint(_ text: String, _ type: Level, _ localTime: LocalTime, _ owner: PIDandTID) {

    let time = "[\(localTime.date)] [\(localTime.time)]"
    let id = "[\(owner.pid):\(owner.tid)]"

    print("[MYLOG] [\(type)] \(time) \(id) \(text)")
}

log.customActionOnMessage = customPrint(_:_:_:_:)

log.format = .textonly
log.output = .custom

log.message("The app's start point...", .info)

```

![Image](https://github.com/user-attachments/assets/fe135516-7ab2-4747-8954-fd1ffe768483)

## Debugging SwiftUI

`Case 1:` as is

```swift

Image(systemName: "globe")
    .onAppear {
        log.message("This is the debug output.")
    }

```

`Case 2:` wrapper

> Add an extension on View that returns itself and calls the logger's message method:

```swift

extension View {
    func message(_ text: @autoclosure () -> String,
                 _ type: PerseusLogger.Level = .debug,
                 _ oput: PerseusLogger.Output = PerseusLogger.output,
                 _ file: StaticString = #file,
                 _ line: UInt = #line) -> Self {

        log.message(text(), type, oput, file, line)

        return self
    }
}

```

> Then use message as a view modifier to print debug information to the console when the view is built:

```swift

VStack {
   ForEach(colors, id: \.self) { color in
      Circle()
         .foregroundColor(color)
         .message("\(color)")
   }
}

```

![Image](https://github.com/user-attachments/assets/bdc3e71f-123c-42b8-b3ae-d98a34f99520)

## Log level and message types

> CPL applies the most common log types for indicating information category.

| Level | Message Type | Description                           |
| :---: | :----------- | :------------------------------------ |
| 5     | DEBUG        | Debugging only                        |
| 4     | INFO         | Helpful, but not essential            |
| 3     | NOTICE       | Might result in a failure             |
| 2     | ERROR        | Errors seen during the code execution |
| 1     | FAULT        | Faults and bugs in the code           |

> Also, CPL considers Message Type to filter, look how it works:

![Image](https://github.com/user-attachments/assets/23b72f6e-39b9-4d7d-be27-7374436deb42)

## Setting the Logger Up

> Default values of CPL options depend on DEBUG/RELEASE.

| Option      | Default in DEBUG     | Default in RELEASE   |
| :---------- | :------------------- | :------------------- |
| tuned       | .on                  | .off                 |
| output      | .standard            | .consoleapp          |
| level       | .debug               | .notice              |

> Other CPL options are the same for DEBUG/RELEASE by default. 

| Option      | Default in DEBUG     | Default in RELEASE   |
| :---------- | :------------------- | :------------------- |
| subsecond   | .nanosecond          | .nanosecond          |
| tidnumber   | .hexadecimal         | .hexadecimal         |
| format      | .short               | .short               |
| marks       | true                 | true                 |
| time        | false                | false                |
| owner       | false                | false                |
| directives  | false                | false                | 
| logObject   | ("Perseus", "Lover") | ("Perseus", "Lover") |

> Special option goes kinda lifehack. Matter only if Simulator. 

| Option      | Default in DEBUG     | Default in RELEASE   |
| :---------- | :------------------- | :------------------- |
| debugIsInfo | true                 | true                 |

### Load (reset) CPL options with JSON config

> Each option can be reseted in run time with json config except option `turned`.

`Case 1:` Using predefined json profile

```swift

import ConsolePerseusLogger

let isReseted = log.loadConfig(.debugRoutine)
let result = isReseted ? "CPL current options loaded." : "Failed to load options!"

log.message(result)

```

`Case 2:` Using custom profile (URL required)

```swift

import ConsolePerseusLogger

var result = ""

if let path = Bundle.main.url(forResource: "CPLConfig", withExtension: "json") {
    let isLoaded = log.loadConfig(path)
    result = isLoaded ? "Options successfully loaded." : "Failed to load options!"
} else {
    result = "Failed to create URL!"
}

log.message(result)

```

![Image](https://github.com/user-attachments/assets/32c6dcee-11ad-44d6-add0-ee8e6ae6c465)

## CPL in SPM package

> In case if CPL in use as a standalone file in SPM package.

```swift

//
//  main.swift
//

import ConsolePerseusLogger

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

## Console.app and Simulator

> Just a matter of fact that Console.app doesn't show any DEBUG message from any app running on Simulator (even if "Include Debug Messages" tapped in Console.app).<br/>

> Console Perseus Logger running on Simulator doesn't pass DEBUG message to Console.app, instead it passes INFO message with text of DEBUG message by default if Simulator runs, so, a passed message being INFO looks like a DEBUG and it works perfactly well.<br/>

> If for some reasons CPL must pass DEBUG like a DEBUG message the option should take false `log.debugIsInfo = false`.

```swift

#if targetEnvironment(simulator)
    log.debugIsInfo = false
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

## Other Required License Notices

© 2025 The SwiftLint Contributors **for** SwiftLint</br>
© GitHub **for** GitHub Action cirruslabs/swiftlint-action@v1</br>
© 2021 Alexandre Colucci, geteimy.com **for** Shell Script SucceedsPostAction.sh</br>

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

> © Mikhail A. Zhigulin of Novosibirsk.
