//
//  PerseusLoggerStar.swift
//  Version: 0.1.0
//
//  PLATFORMS: macOS 10.12+ | iOS 10.0+
//  NOTE: macOS code runs on Simulator
//
//  SWIFT: 5.7 / Xcode 15.2+
//
//  DESC: USE LOGGER LIKE A VARIABLE ANYWHERE YOU WANT.
//
//  Created by Mikhail Zhigulin in 7531.
//
//  Copyright © 7531 - 7533 Mikhail A. Zhigulin of Novosibirsk
//  Copyright © 7531 - 7533 PerseusRealDeal
//
//  All rights reserved.
//
//
//  MIT License
//
//  Copyright © 7531 - 7533 Mikhail A. Zhigulin of Novosibirsk
//  Copyright © 7531 - 7533 PerseusRealDeal
//
//  The year starts from the creation of the world according to a Slavic calendar.
//  September, the 1st of Slavic year.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//
//
// swiftlint:disable file_length
//

import Foundation
import os

// swiftlint:disable type_name
public typealias log = PerseusLogger
// swiftlint:enable type_name

public typealias ConsoleObject = (subsystem: String, category: String)

public class PerseusLogger {

    public enum Status {
        case on
        case off
    }

    public enum Output {
        case xcodedebug
        case consoleapp
        // case outputfile
    }

    public enum Level: Int, CustomStringConvertible {

        public var description: String {
            switch self {
            case .debug:
                return "DEBUG"
            case .info:
                return "INFO"
            case .notice:
                return "NOTICE"
            case .error:
                return "ERROR"
            case .fault:
                return "FAULT"
            }
        }

        case debug  = 5
        case info   = 4
        case notice = 3 // Default.
        case error  = 2
        case fault  = 1
    }

#if DEBUG
    public static var turned = Status.on
    public static var output = Output.xcodedebug
#else
    public static var turned = Status.off
    public static var output = Output.consoleapp
#endif

    public static var level = Level.notice
    public static var short = true
    public static var marks = true

    public static var logObject: ConsoleObject? { // Custom Log Object for Console on Mac.
        didSet {

            guard let obj = logObject else {

                if #available(iOS 14.0, macOS 11.0, *) {
                    consoleLogger = nil
                }

                consoleOSLog = nil

                return
            }

            if #available(iOS 14.0, macOS 11.0, *) {
                consoleLogger = Logger(subsystem: obj.subsystem, category: obj.category)
            } else {
                consoleOSLog = OSLog(subsystem: obj.subsystem, category: obj.category)
            }
        }
    }

    @available(iOS 14.0, macOS 11.0, *)
    private(set) static var consoleLogger: Logger?
    private(set) static var consoleOSLog: OSLog?

    private(set) static var message = "" // Last one.

    public static func message(_ text: @autoclosure () -> String,
                               _ type: Level = .debug,
                               _ file: StaticString = #file,
                               _ line: UInt = #line) {

        guard turned == .on, type.rawValue <= level.rawValue else { return }

        if short {
            message = "\(text())"
        } else {
            let fileName = (file.description as NSString).lastPathComponent
            message = "\(text()), file: \(fileName), line: \(line)"

        }

        message = marks ? "[Logger] [\(type)] \(message)" : message

        switch output {
        case .xcodedebug: passToXcodeDebug()
        case .consoleapp: passToConsoleApp(type)
        }
    }

    private static func passToXcodeDebug() {
        print(message) // DispatchQueue.main.async { print(message) }
    }

    private static func passToConsoleApp(_ mark: Level) {

        if #available(iOS 14.0, macOS 11.0, *) {
            if consoleLogger == nil { consoleLogger = Logger() }

            switch mark {
            case .debug:
                consoleLogger?.debug("\(message)")
            case .info:
                consoleLogger?.info("\(message)")
            case .notice:
                consoleLogger?.notice("\(message)")
            case .error:
                consoleLogger?.error("\(message)")
            case .fault:
                consoleLogger?.fault("\(message)")
            }

            return
        }

        if consoleOSLog == nil { consoleOSLog = OSLog.default }

        switch mark {
        case .debug:
            os_log("%@", log: consoleOSLog!, type: .debug, message)
        case .info:
            os_log("%@", log: consoleOSLog!, type: .info, message)
        case .notice:
            os_log("%@", log: consoleOSLog!, type: .default, message)
        case .error:
            os_log("%@", log: consoleOSLog!, type: .error, message)
        case .fault:
            os_log("%@", log: consoleOSLog!, type: .fault, message)
        }
    }
}
