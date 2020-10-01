//
//  NotificationHandler.swift
//  NotificationSwift
//
//  Created by Isaac Douglas on 02/09/20.
//

import Foundation
import UserNotifications

public class NotificationHandler {

    public static let shared = NotificationHandler()

    public func notificationWith<Info: InfoProtocol>(info: Info, repeats: Bool) {

        let content = UNMutableNotificationContent()
        content.title = info.title
        content.body = info.body
        content.sound = UNNotificationSound.default()
        content.categoryIdentifier = info.categoryIdentifier

        var userInfo = [String: String]()
        userInfo["info"] = toJSON(info: info)
        content.userInfo = userInfo

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: info.time, repeats: repeats)
        let request = UNNotificationRequest(identifier: info.identifier, content: content, trigger: trigger)

        let center = UNUserNotificationCenter.current()
        center.add(request)
    }

    public func removeAllNotification() {
        let center = UNUserNotificationCenter.current()
        center.removeAllPendingNotificationRequests()
    }

    public func removeNotificationWith(identifiers: [String]) {
        let center = UNUserNotificationCenter.current()
        center.removePendingNotificationRequests(withIdentifiers: identifiers)
    }
}

extension NotificationHandler {
    internal func toJSON<Info: InfoProtocol>(info: Info) -> String? {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        guard let json = try? encoder.encode(info) else { return nil }
        return String(data: json, encoding: .utf8)
    }

    internal func getObject<Info: InfoProtocol>(infoType: Info.Type, json: String) -> Info? {
        let decoder = JSONDecoder()
        guard
            let data = json.data(using: .utf8),
            let info = try? decoder.decode(infoType, from: data)
            else {
                return nil
        }
        return info
    }

    internal func userInfoTo<Info: InfoProtocol>(type: Info.Type, userInfo: [AnyHashable: Any]) -> Info? {
        guard
            let infoJSON = userInfo["info"] as? String,
            let info = getObject(infoType: type, json: infoJSON)
            else {
                return nil
        }
        return info
    }

    public func getInfoFor<Info: InfoProtocol>(type: Info.Type, response: UNNotificationResponse) -> Info? {
        let userInfo = response.notification.request.content.userInfo
        return userInfoTo(type: type, userInfo: userInfo)
    }

    public func getInfoFor<Info: InfoProtocol>(type: Info.Type, notification: UNNotification) -> Info? {
        let userInfo = notification.request.content.userInfo
        return userInfoTo(type: type, userInfo: userInfo)
    }
}
