<div align="center">

Console Perseus Logger
==

USE LOGGER LIKE A VARIABLE ANYWHERE YOU WANT

[![Actions Status](https://github.com/perseusrealdeal/ConsolePerseusLogger/actions/workflows/main.yml/badge.svg)](https://github.com/perseusrealdeal/ConsolePerseusLogger/actions/workflows/main.yml)
[![Style](https://github.com/perseusrealdeal/ConsolePerseusLogger/actions/workflows/swiftlint.yml/badge.svg)](https://github.com/perseusrealdeal/ConsolePerseusLogger/actions/workflows/swiftlint.yml)
[![Version](https://img.shields.io/badge/Version-1.7.1-green.svg)](/CHANGELOG.md)
[![Platforms](https://img.shields.io/badge/Platforms-macOS%2010.13+_|_iOS%2011.0+-orange.svg)](https://en.wikipedia.org/wiki/List_of_Apple_products)
[![Xcode 14.2](https://img.shields.io/badge/Xcode-14.2+-red.svg)](https://en.wikipedia.org/wiki/Xcode)
[![Swift 5.7](https://img.shields.io/badge/Swift-5.7-red.svg)](https://www.swift.org)

[`A3 Environment`](/APPROBATION.md) • [`CHANGELOG`](/CHANGELOG.md) • [`Xcode Playground`](https://github.com/PerseusRealDeal/ConsolePerseusLogger/issues/17) • [`MIT License`](/LICENSE)

</div>

---

Usages
==

> `1:` Log to the console.</br>
> `2:` Log to macOS Console.</br>
> `3:` Log to custom output.</br>
> `4:` Collect log messages.</br>
> `5:` Delegate log message.</br>

Integration
==

[![Standalone](https://img.shields.io/badge/Standalone%20-available-informational.svg)](/TheLoggerStar.swift)
[![Swift Package Manager compatible](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-4BC51D.svg)](/Package.swift)

CPL in Use
==

> `Approbation:` 

- [`Swift macOS app`](https://github.com/perseusrealdeal/Arkenstone) 
- [`Swift iOS app`](https://github.com/perseusrealdeal/TheOneRing)

> `Business:` 

- Swift package [`PerseusDarkMode`](https://github.com/PerseusRealDeal/PerseusDarkMode) 
- Swift package [`PerseusGeoKit`](https://github.com/PerseusRealDeal/PerseusGeoKit)
- Swift macOS app [`The Dark Moon`](https://github.com/perseusrealdeal/TheDarkMoon) 
- Swift macOS app [`Convertor mov2gif`](https://github.com/PerseusRealDeal/mov2gif)

Contents
==

* [In brief](#In-brief)
* [Requirements](#Requirements)
* [Third-party software](#Third-party-software)
* [Installation](#Installation)
* [Usage](#Usage)
    * [Log to the console](#Log-to-the-console)
    * [Log to macOS Console](#Log-to-macOS-Console)
    * [Custom log](#Custom-log)
    * [Debugging SwiftUI](#Debugging-SwiftUI)
    * [Log level and message types](#Log-level-and-message-types)
    * [Configuration](#Configuration)
        * [Default settings](#Default-settings)
        * [Load settings with JSON config](#Load-settings-with-JSON-config)
    * [SPM package](#SPM-package)
    * [macOS Console and Simulator](#macOS-Console-and-Simulator)
    * [Collecting logs](#Collecting-logs)
    * [Delegating logs](#Delegating-logs)
        * [End-user message statement](#End-user-message-statement)
        * [To delegate with reporting](#To-delegate-with-reporting)
        * [To delegate without reporting](#To-delegate-without-reporting)
* [Account points](#Account-points)
* [License](#License)
    * [Other required licenses details](#Other-required-licenses-details)
* [Credits](#Credits)
* [Contributing](#Contributing)
* [Author](#Author)
    * [Contact](#Contact)

Our Terms
--

| Acronym | Stands for                                                                                                |
| :-----: | --------------------------------------------------------------------------------------------------------- |
| CPL     | [Console_Perseus_Logger](https://github.com/perseusrealdeal/ConsolePerseusLogger.git)                     |
| PDM     | [Perseus_Dark_Mode](https://github.com/perseusrealdeal/PerseusDarkMode.git)                               |
| PGK     | [Perseus_Geo_Kit](https://github.com/perseusrealdeal/PerseusGeoKit.git)                                   |
| A3      | [Apple_Apps_Approbation](https://docs.google.com/document/d/1K2jOeIknKRRpTEEIPKhxO2H_1eBTof5uTXxyOm5g6nQ) |
| T3      | [The_Technological_Tree](https://github.com/perseusrealdeal/TheTechnologicalTree)                         |
| P2P     | Person_to_Person                                                                                          |

In brief
==

The great home-made product `CPL` is a single author and personale solution developed in `P2P` relationship paradigm.

<div align="center">

`Log Template` 

</div>

```
[TYPE] [DATE] [TIME] [PID:TID] message, file: #, line: #
```

```swift

log.message("text")

```

<!-- 1 -->
![Image](https://github.com/user-attachments/assets/fbf78ea8-8efe-4167-a1ff-a83c20276652)

Requirements
==

`To build:`

- [macOS Monterey 12.7.6+](https://apps.apple.com/by/app/macos-monterey/id1576738294)
- [Xcode 14.2+](https://developer.apple.com/services-account/download?path=/Developer_Tools/Xcode_14.2/Xcode_14.2.xip)

> [!TIP]
> As the single source code [TheLoggerStar.swift](/TheLoggerStar.swift), CPL with minimum changes can be used even in Xcode 10.1

`For Xcode 10.1:` remove all statements starting with

```swift

if #available(iOS 14.0, macOS 11.0, *)

```

Third-party software
==

MIT
--

| Type   | Name                                                                                                                              |
| ------ | --------------------------------------------------------------------------------------------------------------------------------- |
| Style  | [SwiftLint](https://github.com/realm/SwiftLint) / [v0.57.0 for Monterey+](https://github.com/realm/SwiftLint/releases/tag/0.57.0) |
| Script | [SwiftLint Shell Script](/SucceedsPostAction.sh) to run SwiftLint                                                                 |
| Action | [cirruslabs/swiftlint-action@v1](https://github.com/cirruslabs/swiftlint-action/)                                                 |

[Unlicense](https://unlicense.org)
--

| Type   | Name                                                                                                                              |
| ------ | --------------------------------------------------------------------------------------------------------------------------------- |
| Action | [mxcl/xcodebuild@v3](https://github.com/mxcl/xcodebuild)                                                                          |

Installation
==

`Standalone:` Place [`TheLoggerStar.swift`](/TheLoggerStar.swift) (`CPLStar.swift` previously) into your project directly

```swift

log.message("[\(type(of: self))].\(#function)")

```

`Swift Package Manager:` 

```
https://github.com/perseusrealdeal/ConsolePerseusLogger
```

> [!CAUTION]
> Exact Version is strongly recommended.

```swift

import ConsolePerseusLogger

log.message("[\(type(of: self))].\(#function)")

```

> [!NOTE]
> If output is `.consoleapp` (macOS Console app) and Environment Variable `OS_ACTIVITY_MODE` in `disable` log messaging will be restricted for Xcode console, but only.
<!-- 0 -->
![Image](https://github.com/user-attachments/assets/fb64c5cf-70dc-489c-9850-976ea3d5800c)

Usage
==

Log to the console
--

```swift

import ConsolePerseusLogger

log.message("[\(type(of: self))].\(#function)")

```
<!-- 2 -->
![Image](https://github.com/user-attachments/assets/ad0acd00-d55c-4ab9-916e-db32ca8ee236)

Log to macOS Console
--

> [!NOTE]
> To pass messages to Console.app `CPL` employs [`Logger`](https://developer.apple.com/documentation/os/logger) structure (from iOS 14.0, macOS 11.0) and [`OSLog`](https://developer.apple.com/documentation/os/oslog).

`Case 1:` Redirect all messages to .consoleapp

```swift

log.output = .consoleapp
log.message("[\(type(of: self))].\(#function)")

```
<!-- 3 -->
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

Custom log
--

> For any specific combination of the log message details.

```swift

import ConsolePerseusLogger

func customPrint(_ instance: LogMessage) {

    let time = "[\(instance.localTime.date)] [\(instance.localTime.time)]"
    let utc = instance.localTime.timeUTC

    let id = "[\(instance.owner.pid):\(instance.owner.tid)]"
    let dirs = "file: \(instance.fileline.fileName), line: \(instance.fileline.line)"

    print("[MYLOG] \(instance.text) \(id) \(time) UTC: \(utc), \(dirs)")
}

log.customActionOnMessage = customPrint(_:)

log.format = .textonly
log.output = .custom

log.message("The app's start point...", .info)

```
<!-- 4 -->
![Image](https://github.com/user-attachments/assets/2968aef2-9154-4776-9127-bad7a8f8b915)

Debugging SwiftUI
--

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
<!-- 5 -->
![Image](https://github.com/user-attachments/assets/1dcdca20-dbf7-4d91-9dae-278fddf5a747)

Log level and message types
--

> CPL applies the most common log types for indicating information category.

| Level | Message Type | Description                                        |
| :---: | :----------- | :------------------------------------------------- |
| 5     | DEBUG        | Debugging only                                     |
| 4     | INFO         | Helpful, but not essential                         |
| 3     | NOTICE       | Might result in a failure                          |
| 2     | ERROR        | Errors seen during the code execution              |
| 1     | FAULT        | Faults and bugs in the code                        |

> [!IMPORTANT]
> NOTICE in use with end-user notifications as a recommended type, it's a default and almost neutral level.

> Also, CPL considers Message Type to filter, look how it works:
<!-- 6 -->
![Image](https://github.com/user-attachments/assets/45aa8913-cd35-4c4b-b5da-03ce34860221)

Configuration
--

### Default settings

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
| linemode    | .singleLine          | .singleLine          |
| marks       | true                 | true                 |
| time        | false                | false                |
| owner       | false                | false                |
| directives  | false                | false                | 
| logObject   | ("Perseus", "Lover") | ("Perseus", "Lover") |

> Special option goes kinda lifehack. Matter only if Simulator. 

| Option      | Default in DEBUG     | Default in RELEASE   |
| :---------- | :------------------- | :------------------- |
| debugIsInfo | true                 | true                 |

### Load settings with JSON config

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
<!-- 7 -->
![Image](https://github.com/user-attachments/assets/3910b34f-2946-4138-8f59-2bc70bbfb2fa)

SPM package
--

> In SPM package `CPL` can be used as standalone, just place [TheLoggerStar.swift](/TheLoggerStar.swift) into your project directly.

> [!IMPORTANT]
> Statement `typealias log = PerseusLogger` in SPM package should be not public.

> [!IMPORTANT]
> Statement `protocol PerseusDelegatedMessage` in SPM package should be not public, also.

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

// MARK: - The Logger

log.message("The app's start point...", .info)

```

macOS Console and Simulator
--

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

Collecting logs
--

> [PerseusLogger.Report](/Sources/ConsolePerseusLogger/TheReport.swift) and KVO can be used to view last log messages.

```swift
import Foundation

let report = PerseusLogger.Report()
var observation: NSKeyValueObservation?

observation = report.observe(\.lastMessage, options: .new) { _, change in
    // Refresh code
}

log.customActionOnMessage = report.report(_:)

```

`Step 1:` Create a report

`Step 2:` Create an observer for the last message to refresh on change

`Step 3:` `log.customActionOnMessage = report.report(_:)`

> [!NOTE]
> Override method `report(_:)` of [`PerseusLogger.Report`](/Sources/ConsolePerseusLogger/TheReport.swift) to meet expectations with specifics.

> [!WARNING]
> You must be careful to avoid infinite recursion when you try to add a log statement to KVO block definition.

```swift

observation = report.observe(\.lastMessage, options: .new) { _, change in
    
    // Infinite recursion case, fatal error.
    log.message("[\(type(of: self))].\(#function)") // Leads to stack overflow.
    
    // Refresh code
}

```
<!-- 8 -->
![Image](https://github.com/user-attachments/assets/87d8b172-905e-4940-a7fe-d65d48b38796)

Delegating logs
--

### End-user message statement

A log message can be used for easy creating end-user notifications in a way like this:

```swift

log.message("Notification...", .notice, .custom, .enduser)

```
> [!IMPORTANT]
> 1. End-user message egnores `log.turned = .off`, but `log.level` is still matter.
> 2. Message type `.notice` is recommended, it's a default and almost neutral level. 
> 3. Output `.custom` is in use to process end-user messages. 
<!-- 9.1 -->
![Image](https://github.com/user-attachments/assets/75f808b1-7b35-49ea-83bc-954e721d5a51)

### To delegate with reporting

`Step 1:` Find a type to implement `PerseusDelegatedMessage` protocol

`Step 2:` Create a report of `PerseusLogger.Report`

`Step 3:` Set the delegate `report.messageDelegate` to the `PerseusDelegatedMessage` one

`Step 4:` `log.customActionOnMessage = report.report(_:)`
<!-- 9.2 -->
![Image](https://github.com/user-attachments/assets/6bd1a026-436c-4609-a523-fc514deb7159)

### To delegate without reporting

```swift

import ConsolePerseusLogger

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

func customPrint(_ instance: LogMessage) {

    if instance.user == .enduser {
        delegate?.message = instance.text
        return
    }

    print(instance.getMessage() + " customed!")
}

log.customActionOnMessage = customPrint(_:)

let delegate: PerseusDelegatedMessage? = MyEndUserMessageClass()
let greeting = "Hello"

log.message("\(greeting) 1", .notice) // .standard
log.message("\(greeting) 2", .notice, .custom) // .custom
log.message("\(greeting) 3", .notice, .custom, .enduser) // .custom delegated to .enduser

```
<!-- 9.3 -->
![Image](https://github.com/user-attachments/assets/d8dd8a5f-0fba-45cb-90f8-4caded3d1167)

Account points
==

- Preconfigured Swift Package manifest [Package.swift](/Package.swift)
- Preconfigured SwiftLint config [.swiftlint.yml](/.swiftlint.yml)
- Preconfigured SwiftLint CI [swiftlint.yml](/.github/workflows/swiftlint.yml)
- Preconfigured GitHub config [.gitignore](/.gitignore)
- Preconfigured GitHub CI [main.yml](/.github/workflows/main.yml)
- [Changelog](/CHANGELOG.md)
- [A3 environment specification](/APPROBATION.md)
- [SwiftLint shell script](/SucceedsPostAction.sh)

License
==

`MIT License`, see [LICENSE](/LICENSE) for details.

Copyright © 7531 - 7534 Mikhail A. Zhigulin of Novosibirsk<br/>
Copyright © 7531 - 7534 PerseusRealDeal

- The year starts from the creation of the world according to a Slavic calendar.
- September, the 1st of Slavic year. For instance, "Sep 01, 2025" is the beginning of 7534.

Other required licenses details
--

`© 2025 The SwiftLint Contributors` **for** SwiftLint</br>
`© GitHub` **for** GitHub Action cirruslabs/swiftlint-action@v1</br>
`© 2021 Alexandre Colucci, geteimy.com` **for** Shell Script SucceedsPostAction.sh</br>

Credits
==

<table>
  <tr>
      <td>Balance and Control</td>
      <td>Mikhail Zhigulin</td>
  </tr>
  <tr>
      <td>Source Code</td>
      <td>Mikhail Zhigulin</td>
  </tr>
  <tr>
      <td>Documentation</td>
      <td>Mikhail Zhigulin</td>
  </tr>
  <tr>
      <td>Approbation</td>
      <td>Mikhail Zhigulin</td>
  </tr>
  <tr>
      <td>English</td>
      <td>Mikhail Zhigulin</td>
  </tr>
</table>

- Language support: [Reverso](https://www.reverso.net/)
- Git clients: [SmartGit](https://syntevo.com/) and [GitHub Desktop](https://github.com/apps/desktop)

Contributing
==

> [!NOTE]
> The product is constructed in `P2P` relationship paradigm that means the only one single and the same face in the product team during all development process stages.

`Bug reports are welcome`, create an issue and give details.

Author
==

<div align="center">

`© Mikhail A. Zhigulin of Novosibirsk`

</div>

Contact
--

<div align="center">

[E-mail](mailto:mzhigulin@gmail.com) • [Telegram](https://t.me/velociraptor1985) • [GitHub](https://github.com/perseusrealdeal)

</div>
