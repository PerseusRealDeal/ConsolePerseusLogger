//
//  PerseusLogger.swift
//  ConsolePerseusLogger
//
//  For iOS and macOS only. Use Stars to adopt for the platform specifics you need.
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

public let CONSOLE_APP_SUBSYSTEM_DEFAULT = "Perseus"
public let CONSOLE_APP_CATEGORY_DEFAULT = "Logger"

public class PerseusLogger {

    // MARKS: - Specific types

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
                return "NOTE"
            case .error:
                return "ERROR"
            case .fault:
                return "FAULT"
            }
        }

        public var tag: String {
            switch self {
            case .debug:
                return "[DEBUG]"
            case .info:
                return "[INFO ]"
            case .notice:
                return "[NOTE ]"
            case .error:
                return "[ERROR]"
            case .fault:
                return "[FAULT]"
            }
        }

        case debug  = 5
        case info   = 4
        case notice = 3
        case error  = 2
        case fault  = 1
    }

    // MARK: - Properties

#if DEBUG
    public static var turned = Status.on
    public static var output = Output.xcodedebug

    public static var level = Level.debug
#else
    public static var turned = Status.off
    public static var output = Output.consoleapp

    public static var level = Level.notice
#endif

    public static var short = true
    public static var marks = true

    public static var time = true // Ignored for Console.app. Depends on marks and short.

#if targetEnvironment(simulator)
    public static var debugIsInfo = true // Shows DEBUG message as INFO in Console on Mac.
#endif

    public static var logObject: ConsoleObject? {
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

    public static var localTime: String {
        return getLocalTime()
    }

    // MARK: - Internals

    @available(iOS 14.0, macOS 11.0, *)
    private(set) static var consoleLogger: Logger?
    private(set) static var consoleOSLog: OSLog?

    // MARK: - Contract

    // swiftlint:disable:next cyclomatic_complexity
    public static func message(_ text: @autoclosure () -> String,
                               _ type: Level = .debug,
                               _ file: StaticString = #file,
                               _ line: UInt = #line) {

        guard turned == .on, type.rawValue <= level.rawValue else { return }

        var message = ""

        // Path.

        if short {
            message = "\(text())"
        } else {
            let fileName = (file.description as NSString).lastPathComponent
            message = "\(text()), file: \(fileName), line: \(line)"

        }

        // Level.

        message = marks ? "\(type.tag) \(message)" : message

        // Time.

        if output != .consoleapp, time {
            message = marks ? "[\(getLocalTime())] \(message)" : message
        }

        // Print.

        print(message, type)
    }

    // MARK: - Implementation

    private static func print(_ text: String, _ type: Level) {

        let message = text

        if output == .xcodedebug {

            Swift.print(message) // DispatchQueue.main.async { print(message) }

        } else if output == .consoleapp {

            if #available(iOS 14.0, macOS 11.0, *) {

                let logger = consoleLogger ?? Logger(subsystem: CONSOLE_APP_SUBSYSTEM_DEFAULT,
                                                     category: CONSOLE_APP_CATEGORY_DEFAULT)

                switch type {
                case .debug:
#if targetEnvironment(simulator)
                    if debugIsInfo {
                        logger.info("\(message, privacy: .public)")
                    } else {
                        logger.debug("\(message, privacy: .public)")
                    }
#else
                    logger.debug("\(message, privacy: .public)")
#endif
                case .info:
                    logger.info("\(message, privacy: .public)")
                case .notice:
                    logger.notice("\(message, privacy: .public)")
                case .error:
                    logger.error("\(message, privacy: .public)")
                case .fault:
                    logger.fault("\(message, privacy: .public)")
                }

                return
            }

            let consoleLog = consoleOSLog ?? OSLog(subsystem: CONSOLE_APP_SUBSYSTEM_DEFAULT,
                                                   category: CONSOLE_APP_CATEGORY_DEFAULT)

            switch type {
            case .debug:
#if targetEnvironment(simulator)
                if debugIsInfo {
                    os_log("%{public}@", log: consoleLog, type: .info, message)
                } else {
                    os_log("%{public}@", log: consoleLog, type: .debug, message)
                }
#else
                os_log("%{public}@", log: consoleLog, type: .debug, message)
#endif
            case .info:
                os_log("%{public}@", log: consoleLog, type: .info, message)
            case .notice:
                os_log("%{public}@", log: consoleLog, type: .default, message)
            case .error:
                os_log("%{public}@", log: consoleLog, type: .error, message)
            case .fault:
                os_log("%{public}@", log: consoleLog, type: .fault, message)
            }
        }
    }

    private static func getLocalTime() -> String {

        guard let timezone = TimeZone(secondsFromGMT: 0) else { return "TIME" }

        var calendar = Calendar.current

        calendar.timeZone = timezone
        calendar.locale = Locale(identifier: "en_US_POSIX") // Supports nanoseconds. For sure.

        let current = Date(timeIntervalSince1970:(Date().timeIntervalSince1970 +
                                                  Double(TimeZone.current.secondsFromGMT())))

        let details: Set<Calendar.Component> = [.hour, .minute, .second, .nanosecond]
        let components = calendar.dateComponents(details, from: current)

        // Parse.

        guard
            let hour = components.hour?.inTime, // Always in 24-hour.
            let minute = components.minute?.inTime,
            let second = components.second?.inTime,
            let nanosecond = components.nanosecond?.inTime else { return "TIME" }

        return "\(hour):\(minute):\(second):\(nanosecond)"
    }
}

// MARK: - Helpers

private extension Int {

    var inTime: String {
        guard self >= 0, self <= 9 else { return String(self) }
        return "0\(self)"
    }
}
