# ConsolePerseusLogger — Xcode 14.2+

[![Actions Status](https://github.com/perseusrealdeal/ConsolePerseusLogger/actions/workflows/main.yml/badge.svg)](https://github.com/perseusrealdeal/ConsolePerseusLogger/actions/workflows/main.yml)
[![Style](https://github.com/perseusrealdeal/ConsolePerseusLogger/actions/workflows/swiftlint.yml/badge.svg)](https://github.com/perseusrealdeal/ConsolePerseusLogger/actions/workflows/swiftlint.yml)
[![Version](https://img.shields.io/badge/Version-1.6.0-green.svg)](/CHANGELOG.md)
[![Platforms](https://img.shields.io/badge/Platforms-macOS%2010.13+_|_iOS%2011.0+-orange.svg)](https://en.wikipedia.org/wiki/List_of_Apple_products)
[![Xcode 14.2](https://img.shields.io/badge/Xcode-14.2+-red.svg)](https://en.wikipedia.org/wiki/Xcode)
[![Swift 5.7](https://img.shields.io/badge/Swift-5.7-red.svg)](https://www.swift.org)
[![License](http://img.shields.io/:License-MIT-blue.svg)](/LICENSE)

> `[TYPE] [DATE] [TIME] [PID:TID] message, file: #, line: #`

> Home-made product. Light-weight logging lover in Swift. 

> `1:` Log to the console.</br>
> `2:` Log to macOS Console.</br>
> `3:` Log to custom output.</br>
> `4:` Collect logs. Extend [PerseusLogReport](/Sources/ConsolePerseusLogger/PerseusLogReport.swift) to meet expectations with specifics or create your own.</br>
> `5:` Delegate logs. End-user notifications.</br>

> `CPL` is a single author and personale solution developed in `P2P` relationship paradigm.

> `In approbation:` [`iOS app`](https://github.com/perseusrealdeal/TheOneRing) [`macOS app`](https://github.com/perseusrealdeal/Arkenstone) `In business:` [`The Dark Moon`](https://github.com/perseusrealdeal/TheDarkMoon)

## Integration Capabilities

[![Standalone](https://img.shields.io/badge/Standalone%20-available-informational.svg)](/CPLStar.swift)
[![Swift Package Manager compatible](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-4BC51D.svg)](/Package.swift)

> [`Approbation and A3 Environment`](/APPROBATION.md) / [`CHANGELOG`](/CHANGELOG.md) / [`Xcode Playground`](https://github.com/PerseusRealDeal/ConsolePerseusLogger/issues/17)

## Our Terms

> `CPL` stands for `C`onsole `P`erseus `L`ogger.

> `P2P` stands for `person-to-person`. 

> `A3` stands for `A`pple `A`pps `A`pprobation.

# Contents

* [In brief](#In-brief)
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
    * [macOS Console and Simulator](#macOS-Console-and-Simulator)
    * [Collecting logs](#Collecting-logs)
    * [Delegating logs](#Delegating-logs)
* [Points taken into account](#Points-taken-into-account)
* [License MIT](#License-MIT)
    * [Other Required License Notices](#Other-Required-License-Notices)
* [Credits](#Credits)
* [Author](#Author)

# In brief

> USE LOGGER LIKE A VARIABLE ANYWHERE YOU WANT<br/>

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
> If output is `.consoleapp` and Environment Variable `OS_ACTIVITY_MODE` in `disable` log messaging will be restricted for Xcode console, but only.

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
                 _ type: PerseusLogger.Level,
                 _ localTime: LocalTime,
                 _ owner: PIDandTID,
                 _ user: PerseusLogger.User,
                 _ dirs: Directives) {

    let time = "[\(localTime.date)] [\(localTime.time)]"
    let utc = localTime.timeUTC

    let id = "[\(owner.pid):\(owner.tid)]"
    // let text = text.replacingOccurrences(of: "\(type.tag) ", with: "")

    print("[MYLOG] \(text) \(time) \(id) UTC: \(utc)")
}

log.customActionOnMessage = customPrint(_:_:_:_:_:_:)

log.format = .textonly
log.output = .custom

log.message("The app's start point...", .info)

```

![Image](https://github.com/user-attachments/assets/cd4a8b95-b777-4be0-993e-2b846673a1a2)

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

> In SPM package `CPL` can be used as standalone, just place [CPLStar.swift](/CPLStar.swift) into your project directly.

> [!IMPORTANT]
> Statement `typealias log = PerseusLogger` in SPM package should be not public.

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

## macOS Console and Simulator

> [!NOTE]
> `CPL` employs `Logger` structure (from iOS 14.0, macOS 11.0) and `OSLog` to pass messages to macOS Console.

> Just a matter of fact that Console.app doesn't show any DEBUG message from any app running on Simulator (even if "Include Debug Messages" tapped in Console.app).<br/>

> Console Perseus Logger running on Simulator doesn't pass DEBUG message to Console.app, instead it passes INFO message with text of DEBUG message by default, so, a passed message being INFO looks like a DEBUG and it works perfactly well.<br/>

> If for some reasons CPL must pass DEBUG as a DEBUG message the option should take false `log.debugIsInfo = false`, but Console.app will not show DEBUG messages.

```swift

#if targetEnvironment(simulator)
    log.debugIsInfo = false
#endif

```

## Collecting logs

> [PerseusLogReport](/Sources/ConsolePerseusLogger/PerseusLogReport.swift) and KVO can be used to view last log messages.

```swift

let report = PerseusLogReport()
var observation: NSKeyValueObservation?

observation = report.observe(\.lastMessage, options: .new) { _, change in
    // Refresh code
}

log.customActionOnMessage = report.report(_:_:_:_:_:_:)

```

`Step 1:` Create a report

`Step 2:` Create an observer for the last message to refresh on change

`Step 3:` `log.customActionOnMessage = report.report(_:_:_:_:_:_:)`

> [!NOTE]
> Override method `report(_:_:_:_:_:_:)` of `PerseusLogReport` to meet expectations with specifics.

![Image](https://github.com/user-attachments/assets/e4ca3a96-e684-4680-8be0-a45c91c1eca8)

## Delegating logs

A log message can be used for easy creating end-user notifications in a way like this:

```swift

log.message("Notification...", .notice, .custom, .enduser)

```
> [!IMPORTANT]
> 1. End-user message egnores `log.turned = .off`, but `log.level` is still matter.
> 2. Message type `.notice` is recommended, it's a default and almost neutral level. 
> 3. Output `.custom` is in use to process end-user messages. 

![Image](https://github.com/user-attachments/assets/56f36daf-15ca-46d5-8098-4b8aa77703b4)

`Case 1:` **To delegate a log message with reporting:**

`Step 1:` Find a type to implement `PerseusDelegatedMessage` protocol

`Step 2:` Create a report of `PerseusLogReport`

`Step 3:` Set the delegate `report.delegate` to the `PerseusDelegatedMessage` one

`Step 4:` `log.customActionOnMessage = report.report(_:_:_:_:_:_:)`

![Image](https://github.com/user-attachments/assets/3921a0f7-86d8-4dd6-b3a9-99369c037317)

`Case 2:` **To delegate a log message without reporting:**

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

func customEndUserPrint(_ text: String,
                        _ type: PerseusLogger.Level,
                        _ localTime: LocalTime,
                        _ owner: PIDandTID,
                        _ user: PerseusLogger.User,
                        _ dirs: Directives) {

    let text = text.replacingOccurrences(of: "\(type.tag) ", with: "")

    if user == .enduser {
        delegate?.message = text
    }
}

log.customActionOnMessage = customEndUserPrint(_:_:_:_:_:_:)

var delegate: PerseusDelegatedMessage? = MyEndUserMessageClass()
let greeting = "Hello"

log.message(greeting, .notice, .custom, .enduser)

```

![Image](https://github.com/user-attachments/assets/b615d8d4-3901-4d5f-9eb4-b1c82410ac2f)

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
