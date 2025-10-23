# ConsolePerseusLogger — Xcode 14.2+

[![Actions Status](https://github.com/perseusrealdeal/ConsolePerseusLogger/actions/workflows/main.yml/badge.svg)](https://github.com/perseusrealdeal/ConsolePerseusLogger/actions/workflows/main.yml)
[![Style](https://github.com/perseusrealdeal/ConsolePerseusLogger/actions/workflows/swiftlint.yml/badge.svg)](https://github.com/perseusrealdeal/ConsolePerseusLogger/actions/workflows/swiftlint.yml)
[![Version](https://img.shields.io/badge/Version-1.6.0-green.svg)](/CHANGELOG.md)
[![Platforms](https://img.shields.io/badge/Platforms-macOS%2010.13+_|_iOS%2011.0+-orange.svg)](https://en.wikipedia.org/wiki/List_of_Apple_products)
[![Xcode 14.2](https://img.shields.io/badge/Xcode-14.2+-red.svg)](https://en.wikipedia.org/wiki/Xcode)
[![Swift 5.7](https://img.shields.io/badge/Swift-5.7-red.svg)](https://www.swift.org)
[![License](http://img.shields.io/:License-MIT-blue.svg)](/LICENSE)

> `[TYPE] [DATE] [TIME] [PID:TID] message, file: #, line: #`

> Light-weight logging lover in Swift. Hereinafter `CPL` stands for `C`onsole `P`erseus `L`ogger.

> - Log to the console.<br/>
> - Log to macOS Console.app.<br/>
> - Log to custom output.<br/>
> - Collect logs. Extend [PerseusLogReport](/Sources/ConsolePerseusLogger/PerseusLogReport.swift) to meet expectations with specifics or create your own.<br/>
> - Delegate logs. End-user notifications.

> `CPL` is a single author and personale solution developed in `person-to-person` relationship paradigm.

> `P2P` stands for `person-to-person`.

> `In approbation:` [`iOS app`](https://github.com/perseusrealdeal/TheOneRing) [`macOS app`](https://github.com/perseusrealdeal/Arkenstone) `In business:` [`The Dark Moon`](https://github.com/perseusrealdeal/TheDarkMoon)

# Contents

* [Integration Capabilities](#Integration-Capabilities)
* [Approbation Matrix](#Approbation-Matrix)
* [In brief](#In-brief->-Idea-to-use)
* [Build requirements](#Build-requirements)
* [Third-party software](#Third-party-software)
* [Installation](#Installation)
* [Usage](#Usage)
    * [Log to the console](#Log-to-the-console)
    * [Log to macOS Console](#Log-to-macOS-Console)
    * [Custom log](#Custom-log)
    * [Debugging SwiftUI](#Debugging-SwiftUI)
    * [Log level and message types](#Log-level-and-message-types)
    * [Setting the Logger Up](#Setting-the-Logger-Up)
    * [CPL in SPM package](#CPL-in-SPM-package)
    * [Console.app and Simulator](#Console.app-and-Simulator)
    * [Collecting logs](#Collecting-logs)
    * [Delegating logs](#Delegating-logs)
* [Points taken into account](#Points-taken-into-account)
* [License MIT](#License-MIT)
    * [Other Required License Notices](#Other-Required-License-Notices)
* [Credits](#Credits)
* [Author](#Author)

# Integration Capabilities

[![Standalone](https://img.shields.io/badge/Standalone%20-available-informational.svg)](/CPLStar.swift)
[![Swift Package Manager compatible](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-4BC51D.svg)](/Package.swift)

> [!TIP]
> To meet expectations with specifics use [Standalone](/CPLStar.swift) to adopt `CPL`.

# Approbation Matrix

> [`A3 Environment and Approbation`](/APPROBATION.md) / [`CHANGELOG`](/CHANGELOG.md) for details.

> Xcode playground [download page](https://github.com/PerseusRealDeal/ConsolePerseusLogger/issues/17).

# In brief > Idea to use

> USE LOGGER LIKE A VARIABLE ANYWHERE YOU WANT.<br/>

![Image](https://github.com/user-attachments/assets/fbf78ea8-8efe-4167-a1ff-a83c20276652)

# Build requirements

- [macOS Monterey 12.7.6+](https://apps.apple.com/by/app/macos-monterey/id1576738294) / [Xcode 14.2+](https://developer.apple.com/services-account/download?path=/Developer_Tools/Xcode_14.2/Xcode_14.2.xip)

> [!TIP]
> As the single source code [CPLStar.swift](/CPLStar.swift) CPL with minimum changes can be used even in Xcode 10.1, just remove all statements starting with `if #available(iOS 14.0, macOS 11.0, *)`.

# Third-party software

| Type   | Name                                                                                                                              | License                            |
| ------ | --------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------- |
| Style  | [SwiftLint](https://github.com/realm/SwiftLint) / [v0.57.0 for Monterey+](https://github.com/realm/SwiftLint/releases/tag/0.57.0) | MIT                                |
| Script | [SwiftLint Shell Script](/SucceedsPostAction.sh) to run SwiftLint                                                                 | MIT                                |
| Action | [mxcl/xcodebuild@v3](https://github.com/mxcl/xcodebuild)                                                                          | [Unlicense](https://unlicense.org) |
| Action | [cirruslabs/swiftlint-action@v1](https://github.com/cirruslabs/swiftlint-action/)                                                 | MIT                                |

# Installation

`Standalone:` Place [CPLStar.swift](/CPLStar.swift) into your project directly

```swift

log.message("[\(type(of: self))].\(#function)")

```

`Swift Package Manager:` `https://github.com/perseusrealdeal/ConsolePerseusLogger` 

> Exact Version is strongly recommended.

```swift

import ConsolePerseusLogger

log.message("[\(type(of: self))].\(#function)")

```

> [!NOTE]
> If output is consoleapp and Environment Variable `OS_ACTIVITY_MODE` in `disable` log messaging will be restricted for Xcode console, but only.

![Image](https://github.com/user-attachments/assets/fb64c5cf-70dc-489c-9850-976ea3d5800c)

# Usage

## Log to the console

```swift

import ConsolePerseusLogger

log.message("[\(type(of: self))].\(#function)")

```

![Image](https://github.com/user-attachments/assets/ad0acd00-d55c-4ab9-916e-db32ca8ee236)

## Log to macOS Console

> [!NOTE]
> To pass messages to Console.app `CPL` employs `Logger` structure (from iOS 14.0, macOS 11.0) and `OSLog`.

`Case 1:` Redirect all messages to .consoleapp

```swift

log.output = .consoleapp
log.message("[\(type(of: self))].\(#function)")

```

![Image](https://github.com/user-attachments/assets/276bbeec-3883-4c2d-a1d2-4e1f78d3f5ed)

`Case 2:` Redirect the message to .consoleapp

```swift

log.message("[\(type(of: self))].\(#function)", .debug, .consoleapp)

```

> [!TIP]
> Set custom titles for Console.app Subsystem and Category

```swift

log.logObject = ("MyApp", "MyLover") // Customs for Console.app Subsystem and Category.

```

## Custom log

> If a specific combination of message marks or other change is expected for some reasons.

```swift

import ConsolePerseusLogger

typealias Level = ConsolePerseusLogger.PerseusLogger.Level
typealias User = ConsolePerseusLogger.PerseusLogger.User

func customPrint(_ text: String,
                 _ type: Level,
                 _ localTime: LocalTime,
                 _ owner: PIDandTID,
                 _ user: User) {

    let time = "[\(localTime.date)] [\(localTime.time)]"
    let id = "[\(owner.pid):\(owner.tid)]"

    print("[\(type)] [MYLOG] \(time) \(id) \(text)")
}

log.customActionOnMessage = customPrint(_:_:_:_:_:)

log.format = .textonly
log.output = .custom

log.message("The app's start point...", .info)

```

![Image](https://github.com/user-attachments/assets/692b7466-7244-427b-b25c-6b5db4a84674)

## Debugging SwiftUI

`Case 1:` As Is

```swift

Image(systemName: "globe")
    .onAppear {
        log.message("This is the debug output.")
    }

```

`Case 2:` Wrapper

> Extend View with the method `message(_:_:_:_:_:)`:

```swift

extension View {
    func message(_ text: @autoclosure () -> String,
                 _ type: PerseusLogger.Level = .debug,
                 _ oput: PerseusLogger.Output = PerseusLogger.output,
                 _ user: PerseusLogger.User = .operative,
                 _ file: StaticString = #file,
                 _ line: UInt = #line) -> Self {

        log.message(text(), type, oput, user, file, line)

        return self
    }
}

```

> Then use `message` as `a view modifier` to output a message:

```swift

VStack {
   ForEach(colors, id: \.self) { color in
      Circle()
         .foregroundColor(color)
         .message("\(color)")
   }
}

```

![Image](https://github.com/user-attachments/assets/1dcdca20-dbf7-4d91-9dae-278fddf5a747)

## Log level and message types

> CPL applies the most common log types for indicating information category.

| Level | Message Type | Description                                        |
| :---: | :----------- | :------------------------------------------------- |
| 5     | DEBUG        | Debugging only                                     |
| 4     | INFO         | Helpful, but not essential                         |
| 3     | NOTICE       | Might result in a failure or end-user notification |
| 2     | ERROR        | Errors seen during the code execution              |
| 1     | FAULT        | Faults and bugs in the code                        |

> Also, CPL considers Message Type to filter, look how it works:

![Image](https://github.com/user-attachments/assets/32db0216-5e71-4615-8f01-8c222cb0ae0d)

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

![Image](https://github.com/user-attachments/assets/0dc0848b-824c-406a-95ca-c9987133ad67)

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
> [!IMPORTANT]
> Statement `typealias log = PerseusLogger` should be not public in [CPLStar.swift](/CPLStar.swift).

`public case 1:` Package Import `https://github.com/perseusrealdeal/ConsolePerseusLogger` 

`public case 2:` Playground Source Code.

## Console.app and Simulator

> Just a matter of fact that Console.app doesn't show any DEBUG message from any app running on Simulator (even if "Include Debug Messages" tapped in Console.app).<br/>

> Console Perseus Logger running on Simulator doesn't pass DEBUG message to Console.app, instead it passes INFO message with text of DEBUG message by default if Simulator runs, so, a passed message being INFO looks like a DEBUG and it works perfactly well.<br/>

> If for some reasons CPL must pass DEBUG like a DEBUG message the option should take false `log.debugIsInfo = false`, but Console.app will not show DEBUG messages.

```swift

#if targetEnvironment(simulator)
    log.debugIsInfo = false
#endif

```

> [!NOTE]
> To pass messages to Console.app `CPL` employs `Logger` structure (from iOS 14.0, macOS 11.0) and `OSLog`.

## Collecting logs

> [PerseusLogReport](/Sources/ConsolePerseusLogger/PerseusLogReport.swift) and KVO can be used to view last log messages.

```swift

let report = PerseusLogReport()
var observation: NSKeyValueObservation?

observation = report.observe(\.lastMessage, options: .new) { _, change in
    // Refresh code
}

log.customActionOnMessage = report.report(_:_:_:_:_:)

```

`Step 1:` Create a report

`Step 2:` Create an observer for the last message to refresh on change

`Step 3:` `log.customActionOnMessage = report.report(_:_:_:_:_:)`

![Image](https://github.com/user-attachments/assets/5ee19176-2a08-4697-b6e3-f1521d962500)

> [!NOTE]
> Override method `report(_:_:_:_:_:)` of `PerseusLogReport` to meet expectations with specifics.

## Delegating logs

A log message can be used for easy creating end-user notifications in a way like this:

```swift

log.message("Notification...", .notice, .custom, .enduser)

```

> End-user log messages always ingore `log.turned = .off` and will work, but `log.level` is still matter.

> [!IMPORTANT]
> Always pass end-user messages with `log.level = .notice` type, it's a default and almost neutral level. 

> [!IMPORTANT]
> Always pass end-user messages via `log.output = .custom` that is used to process them by `log.customActionOnMessage` calling. 

![Image](https://github.com/user-attachments/assets/ff8f23d0-6dd2-4605-a6fa-742796b839e8)

`Case 1:` **To delegate a log message with a report**

`Step 1:` Find a type to implement `PerseusDelegatedMessage` protocol

`Step 2:` Create a report of `PerseusLogReport`

`Step 3:` Set the delegate `report.delegate` to the `PerseusDelegatedMessage` one

`Step 4:` `log.customActionOnMessage = report.report(_:_:_:_:_:)`

![Image](https://github.com/user-attachments/assets/06b9ccb4-1a83-4769-a74e-3edec7743a74)

`Case 2:` **To delegate a log message without a report**

```swift

import ConsolePerseusLogger

typealias Level = ConsolePerseusLogger.PerseusLogger.Level
typealias User = ConsolePerseusLogger.PerseusLogger.User

class MyEndUserMessageClass: PerseusDelegatedMessage {
    var message: String = "" {
        didSet {
            didSetEndUserMessage()
        }
    }

    private func didSetEndUserMessage() {
        log.message("[\(type(of: self))].\(#function): \(message)")
    }
}

func customPrint(_ text: String,
                 _ type: Level,
                 _ localTime: LocalTime,
                 _ owner: PIDandTID,
                 _ user: User) {

    let text = text.replacingOccurrences(of: "\(type.tag) ", with: "")

    if user == .enduser {
        delegate?.message = text
    }
}

log.customActionOnMessage = customPrint(_:_:_:_:_:)

var delegate: PerseusDelegatedMessage? = MyEndUserMessageClass()
let greeting = "Hello!"

log.message(greeting, .notice, .custom, .enduser)

```

![Image](https://github.com/user-attachments/assets/118df2b0-e4e7-4e38-9b22-1fd472f0a91c)

# Points taken into account

- Preconfigured Swift Package manifest [Package.swift](/Package.swift)
- Preconfigured SwiftLint config [.swiftlint.yml](/.swiftlint.yml)
- Preconfigured SwiftLint CI [swiftlint.yml](/.github/workflows/swiftlint.yml)
- Preconfigured GitHub config [.gitignore](/.gitignore)
- Preconfigured GitHub CI [main.yml](/.github/workflows/main.yml)

# License MIT

Copyright © 7531 - 7534 Mikhail A. Zhigulin of Novosibirsk<br/>
Copyright © 7531 - 7534 PerseusRealDeal

- The year starts from the creation of the world according to a Slavic calendar.
- September, the 1st of Slavic year. It means that "Sep 01, 2024" is the beginning of 7533.

## Other Required License Notices

© 2025 The SwiftLint Contributors **for** SwiftLint</br>
© GitHub **for** GitHub Action cirruslabs/swiftlint-action@v1</br>
© 2021 Alexandre Colucci, geteimy.com **for** Shell Script SucceedsPostAction.sh</br>

[LICENSE](/LICENSE) for details.

# Credits

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
