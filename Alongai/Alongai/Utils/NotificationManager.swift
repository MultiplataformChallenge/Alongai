//
//  NotificationManager.swift
//  Multiplataform
//
//  Created by Hiago Chagas on 26/05/21.
//

import UserNotifications

enum NotificationType: String {
//    case water = "waterNotification"
//    case posture = "postureNotification"
    case exercise = "exerciseNotification"
}

class NotificationManager {
    // singleton variable, used for all the manipulations
    private var notificationTypeContentDict: [NotificationType: UNMutableNotificationContent] = [:]
    private var notificationTypeTriggerDict: [NotificationType: UNTimeIntervalNotificationTrigger] = [:]

    public static let shared = NotificationManager()
    
    private init() {
        let exerciseNotification = UNMutableNotificationContent()
        exerciseNotification.title = "Hora do treino!"
        exerciseNotification.body = "Que tal darmos uma alongada agora, hein?"
        exerciseNotification.sound = UNNotificationSound.default
        notificationTypeContentDict[.exercise] = exerciseNotification
    }
    
    // when the app launches for the first time, the user gotta allow the notifications
    public func requestPermissions() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                print("Permission granted")
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    public func setTimeOfNotification(ofType notificationType: NotificationType, minutes: Double = 1) {
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60 * minutes, repeats: true)
        notificationTypeTriggerDict[notificationType] = trigger
    }
    
    public func activateNotification(ofType notificationType: NotificationType) {
        guard let content = notificationTypeContentDict[notificationType] else { return }
        let trigger = notificationTypeTriggerDict[notificationType]
        let request = UNNotificationRequest(identifier: notificationType.rawValue, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
    
    public func deactivateNotification(ofType notificationType: NotificationType) {
        UNUserNotificationCenter.current().removeDeliveredNotifications(withIdentifiers: [notificationType.rawValue])
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [notificationType.rawValue])
    }
    
    public func updateNotification(ofType notificationType: NotificationType, minutes: Double) {
        self.setTimeOfNotification(ofType: notificationType, minutes: minutes)
        self.activateNotification(ofType: notificationType)
    }
}
