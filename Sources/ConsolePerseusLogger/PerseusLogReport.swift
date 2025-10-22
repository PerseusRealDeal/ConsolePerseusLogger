//
//  PerseusLogReport.swift
//  ConsolePerseusLogger
//
//  Created by Mikhail Zhigulin in 7534 (15.10.2025).
//
//  BASED_ON_REPORT: https://gist.github.com/PerseusRealDeal/9a4118301b59d43969d8edf5ebc3a571
//
//  Used firstly in projects previously, and base part also:
//
//  iOS: https://github.com/PerseusRealDeal/TheOneRing
//  macOS: https://github.com/PerseusRealDeal/Arkenstone
//
//  Copyright © 7534 Mikhail A. Zhigulin of Novosibirsk
//  Copyright © 7534 PerseusRealDeal
//
//  The year starts from the creation of the world according to a Slavic calendar.
//  September, the 1st of Slavic year.
//
//  Licensed under the MIT license. See LICENSE file.
//  All rights reserved.
//

import Foundation

public protocol PerseusDelegatedMessage {
    var message: String { get set }
}

public class PerseusLogReport: NSObject {

    public var delegate: PerseusDelegatedMessage? // Delegate for end-user messages.
    public var text: String { report }

    @objc public dynamic var lastMessage: String = "" {
        didSet {

            // TODO: Resize report

            /*
            let count = report.count
            if count > limit {
                report = report.dropFirst(count - limit).description

                if let position = report.range(of: newLine)?.upperBound {
                    report.removeFirst(position.utf16Offset(in: report)-2)
                }
            }
            */

            report.append(report.isEmpty ? lastMessage : newLine + lastMessage)
        }
    }

    private var report = "" // Last messages.

    public let limit: Int
    public let newLine: String

    public static let newLineDefault = "\r\n--\r\n"
#if os(iOS)
    public static let limitDefault = 1000
#elseif os(macOS)
    public static let limitDefault = 3000
#endif

    public init(_ limit: Int = PerseusLogReport.limitDefault,
                _ newLine: String = PerseusLogReport.newLineDefault) {
        self.limit = limit
        self.newLine = newLine
    }

    // swiftlint:disable:next function_parameter_count
    public func report(_ text: String,
                       _ type: PerseusLogger.Level,
                       _ localTime: LocalTime,
                       _ owner: PIDandTID,
                       _ user: PerseusLogger.User) {

        let text = text.replacingOccurrences(of: "\(type.tag) ", with: "")
        lastMessage = "[\(localTime.date)] [\(localTime.time)] \(type.tag)\r\n\(text)"

        if user == .enduser {
            delegate?.message = text
        }
    }

    public func clear() {
        report = ""
    }
}
