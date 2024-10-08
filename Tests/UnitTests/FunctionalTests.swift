//
//  FunctionalTests.swift
//  UnitTests
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

import XCTest
@testable import ConsolePerseusLogger

final class FunctionalTests: XCTestCase {

    func test_is_log_typealias_for_Logger() {
        XCTAssertEqual("\(log.self)", "\(PerseusLogger.self)")
    }

#if DEBUG
    func test_is_status_on() {
        XCTAssertEqual(log.turned, .on)
    }

    func test_is_output_xcodedebug() {
        XCTAssertEqual(log.output, .xcodedebug)
    }
#else
    func test_is_status_off() {
        XCTAssertEqual(log.turned, .off)
    }

    func test_is_output_consoleapp() {
        XCTAssertEqual(log.output, .consoleapp)
    }
#endif

    func test_is_level_notice() {
        XCTAssertEqual(log.level, .notice)
    }

    func test_is_message_short() {
        XCTAssertTrue(log.short)
    }
}
