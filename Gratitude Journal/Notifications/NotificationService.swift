//
//  NotificationService.swift
//  Gratitude Journal
//
//  Created by Tatiana Ampilogova on 1/7/22.
//

import UIKit
import NotificationCenter

class NotificationService {
    
    public func notificationsScheduler(hours: [Int]) {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        
        let content = UNMutableNotificationContent()
        content.title = loc("water.tracker")
        content.body = loc("notice")
        content.sound = UNNotificationSound.default
        
        for time in hours {
            let dateComponents = DateComponents(hour: time)
            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
            let request = UNNotificationRequest(identifier: "id " + String(time), content: content, trigger: trigger)
            UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        }
    }
}
