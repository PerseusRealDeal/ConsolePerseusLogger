//
//  CPLStartTests.swift
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

    override static func setUp() {
        super.setUp()

        log.marks = false
        log.time = false
        log.owner = true
    }
/*
    override static func tearDown() {
        super.tearDown()
    }

    func test_zero() { XCTFail("Tests not yet implemented in \(type(of: self)).") }
*/
    func test_the_first_success() {
        log.message("[\(type(of: self))].\(#function)")

        let isReseted = log.loadConfig(.debugRoutine)
        let result = isReseted ? "CPL options loaded." : "Failed to load options!"

        log.message(result)
    }
}
