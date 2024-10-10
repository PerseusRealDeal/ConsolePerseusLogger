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

    public enum Output: CustomStringConvertible {

        public var description: String {
            switch self {
            case .xcodedebug:
                return "Xcode Debug Console"
            case .consoleapp:
                return "Console App on Mac"
            }
        }

        case xcodedebug
        case consoleapp
        // case outputfile
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

    public static var logObject: ConsoleObject? { // Custom Log Object for Console on Mac.
        didSet {

            guard let subsystem = logObject?.subsystem, let category = logObject?.category
            else {

                if #available(iOS 14.0, macOS 11.0, *) {
                    consoleLogger = nil
                }

                consoleOSLog = nil

                return
            }

            if #available(iOS 14.0, macOS 11.0, *) {
                consoleLogger = Logger(subsystem: subsystem, category: category)
            } else {
                consoleOSLog = OSLog(subsystem: subsystem, category: category)
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
            message = output == .consoleapp ? "\(text())" : "\(type): \(text())"
        } else {

            let fileName = (file.description as NSString).lastPathComponent

            message = output == .consoleapp ? "\(text()), file: \(fileName), line: \(line)" :
            "\(type): \(text()), file: \(fileName), line: \(line)"
        }

        switch output {
        case .xcodedebug: passToXcodeDebug()
        case .consoleapp: passToConsoleApp(required: type)
        }
    }

    private static func passToXcodeDebug() {
        print(message) // DispatchQueue.main.async { print(message) }
    }

    private static func passToConsoleApp(required: Level) {

        if #available(iOS 14.0, macOS 11.0, *) {
            // consoleLogger, if nil create a default one.
            print(message + " (iOS 14.0, macOS 11.0, *)")
            return
        }

        if #available(macOS 10.12, *) {
            // consoleOSLog, if nil create a default one.
            print(message + " (macOS 10.12, *)")
            return
        }

        if #unavailable(iOS 14.0) { // Code runs from iOS 13 and earlier
            // os_log.
            print(message + " (iOS 13 and earlier)")
            return
        }
    }
}
