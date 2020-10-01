//
//  InfoProtocol.swift
//  NotificationSwift
//
//  Created by Isaac Douglas on 02/09/20.
//

import Foundation

public protocol InfoProtocol: class, Codable {
    var identifier: String { get }
    var categoryIdentifier: String { get }
    var title: String { get }
    var body: String { get }
    var time: TimeInterval { get }
}
