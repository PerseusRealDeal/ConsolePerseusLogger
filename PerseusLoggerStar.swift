//
//  PerseusLoggerStar.swift
//  Version: 0.1.0
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
                               _ type: Level = .notice,
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
