//
//  PerseusLogger.swift
//  ConsolePerseusLogger
//
//  Created by Mikhail Zhigulin in 7531.
//
//  Copyright © 7531 - 7533 Mikhail A. Zhigulin of Novosibirsk
//  Copyright © 7531 - 7533 PerseusRealDeal
//
//  The year starts from the creation of the world according to a Slavic calendar.
//  September, the 1st of Slavic year.
//
//  Licensed under the MIT license. See LICENSE file.
//  All rights reserved.
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
