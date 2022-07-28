//
//  NotificationManager.swift
//  Inudoption
//
//  Created by Daniel Moreno on 7/27/22.
//

import Foundation
import UserNotifications

class NotificationManager {

    static let shared = NotificationManager()

    private let userNotificationCenter = UNUserNotificationCenter.current()

    private init() { }

    // First thing - Request permission to the user
    func requestNotificationPermission() {
        userNotificationCenter.requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }

    func showNotification(title: String, subtitle: String) {
        isNotificationPermissionGranted { isGranted in
            if isGranted {
                let content = UNMutableNotificationContent()

                content.title = title
                content.subtitle = subtitle
                content.sound = .default

                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)


                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

                self.userNotificationCenter.add(request)
            }
        }
    }

    func isNotificationPermissionGranted(completionHandler: @escaping (Bool) -> Void) {
        userNotificationCenter.getNotificationSettings { settings in
            let authStatus = settings.authorizationStatus
            let granted = authStatus == .authorized || authStatus == .provisional
            completionHandler(granted)
        }
    }
}
