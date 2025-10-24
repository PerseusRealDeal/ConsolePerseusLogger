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
            resizeReportIfNeeded()
            appendLastMessageToReport()
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
                       _ user: PerseusLogger.User,
                       _ dirs: Directives) {

        let text = text.replacingOccurrences(of: "\(type.tag) ", with: "")
        lastMessage = "[\(localTime.date)] [\(localTime.time)] \(type.tag)\r\n\(text)"

        if user == .enduser {
            delegate?.message = text
        }
    }

    public func clear() {
        report = ""
    }

    private func resizeReportIfNeeded() {

        let lmCount = lastMessage.count
        let nlCount = newLine.count

        // Can the last message be reported?
        guard lmCount != 0, lmCount < limit else {
            return
        }

        // Should the report be resized?
        let length = lmCount + report.count + (report.isEmpty ? 0 : nlCount)
        guard limit - length < 0 else {
            return
        }

        // What length to remove?
        let messages = report.components(separatedBy: newLine)
        let messagesCount = messages.count - 1

        var lengthToRemove = 0
        var itemCount = 0

        for item in messages {

            itemCount += 1
            let newLineLength = messagesCount == 0 ? 0 : nlCount

            lengthToRemove += (item.count + newLineLength)

            if itemCount == messagesCount, messagesCount > 2 {
                lengthToRemove -= nlCount // There's no new line in the report end
            }

            // Is it enough?
            let reportAfter = report.count - lengthToRemove
            let lastMessageAfter = reportAfter != 0 ? nlCount + lmCount : lmCount

            if limit - (reportAfter + lastMessageAfter) >= 0 {
                break
            }
        }

        // Final check
        guard report.count >= lengthToRemove else {
            return
        }

        // Free space
        report.removeFirst(lengthToRemove)
    }

    private func appendLastMessageToReport() {

        guard lastMessage.isEmpty == false, lastMessage.count < limit else {
            return
        }

        let length = (lastMessage.count + report.count + (report.isEmpty ? 0 : newLine.count))

        guard limit - length >= 0 else {
            return
        }

        report.append(report.isEmpty ? lastMessage : newLine + lastMessage)
    }
}
