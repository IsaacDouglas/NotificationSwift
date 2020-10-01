//
//  Info.swift
//  NotificationSwift_Example
//
//  Created by Isaac Douglas on 03/09/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import NotificationSwift

class Info: InfoProtocol {
    var identifier: String
    var categoryIdentifier: String
    var title: String
    var body: String
    var time: TimeInterval

    init (identifier: String, categoryIdentifier: String, title: String, body: String, time: TimeInterval) {
        self.identifier = identifier
        self.categoryIdentifier = categoryIdentifier
        self.title = title
        self.body = body
        self.time = time
    }
}
