//
//  TheReport.swift
//  ConsolePerseusLogger
//
//  Created by Mikhail Zhigulin in 7534 (15.10.2025).
//
//  BASED_ON_REPORT: https://gist.github.com/PerseusRealDeal/9a4118301b59d43969d8edf5ebc3a571
//
//  Used firstly in the following projects previously, and base part also:
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

extension PerseusLogger {

    public class Report: NSObject {

        // MARK: - Internals

        private var delegate: PerseusDelegatedMessage? // Delegate for end-user messages.
        private var report = "" // Last messages.

        // MARK: - Properties

        @objc public dynamic var lastMessage: String = "" {
            didSet {
                resizeReportIfNeeded()
                appendLastMessageToReport()
            }
        }

        public var messageDelegate: AnyObject? {
            didSet {
                delegate = messageDelegate as? PerseusDelegatedMessage
            }
        }

        public var text: String { report }

        // MARK: - Constants

        public let limit: Int
        public let newLine: String

#if os(iOS)
        public static let limitDefault = 1000
#elseif os(macOS)
        public static let limitDefault = 3000
#endif

        // MARK: - Initializer

        public init(limited: Int = Report.limitDefault, _ newLine: String = "\r\n--\r\n") {
            self.limit = limited
            self.newLine = newLine
        }

        // MARK: - Contract

        // swiftlint:disable:next function_parameter_count
        public func report(_ text: String,
                           _ type: Level,
                           _ localTime: LocalTime,
                           _ owner: PIDandTID,
                           _ user: User,
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

        // MARK: - Realization

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

            let newLinelength = report.isEmpty ? 0 : newLine.count
            let length = (lastMessage.count + report.count + newLinelength)

            guard limit - length >= 0 else {
                return
            }

            report.append(report.isEmpty ? lastMessage : newLine + lastMessage)
        }
    }
}
