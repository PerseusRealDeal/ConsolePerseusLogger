//
//  T3Component.swift
//  T3Component
//
//  Created by Mikhail Zhigulin in 7531.
//
//  Copyright © 7531 - 7533 Mikhail A. Zhigulin of Novosibirsk
//
//  The year starts from the creation of the world according to a Slavic calendar.
//  September, the 1st of Slavic year.
//
//  Licensed under the MIT license. See LICENSE file.
//  All rights reserved.
//

struct T3Component {
    var text = "Hello, World!"

    init() { log.message("[\(type(of: self))].\(#function)") }
}
