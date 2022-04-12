//
//  NotificationService.swift
//  Gratitude Journal
//
//  Created by Tatiana Ampilogova on 1/7/22.
//

import UIKit
import NotificationCenter

class NotificationService {
    
    public func notificationsScheduler(hours: Int, minute: Int, weekdays: [Int]) {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        
        let content = UNMutableNotificationContent()
        content.title = loc("gratefuli")
        content.body = loc("notice")
        content.sound = UNNotificationSound.default
        
        for day in weekdays {
            var dateComponents = DateComponents()
            dateComponents.weekday = day
            dateComponents.hour = hours
            dateComponents.minute = minute
            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        }
    }
}
