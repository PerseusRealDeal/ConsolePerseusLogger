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

// swiftlint:disable type_name
public typealias log = PerseusLogger
// swiftlint:enable type_name

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

        case debug  = 5 // Default.
        case info   = 4
        case notice = 3
        case error  = 2
        case fault  = 1
    }

#if DEBUG
    public static var turned = Status.on
#else
    public static var turned = Status.off
#endif

    public static var level = Level.debug
    public static var short = true

    private(set) static var message = "" // Last one.

    public static func message(_ text: @autoclosure () -> String,
                               _ type: Level = .debug,
                               _ file: StaticString = #file,
                               _ line: UInt = #line) {

        guard turned == .on, type.rawValue <= level.rawValue else { return }

        if short {
            message = "\(type): \(text())"
        } else {
            let fileName = (file.description as NSString).lastPathComponent
            message = "\(type): \(text()), file: \(fileName), line: \(line)"
        }

        print(message) // DispatchQueue.main.async { print(message) }
    }
}
