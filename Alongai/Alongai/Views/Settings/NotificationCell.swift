//
//  NotificationCell.swift
//  Multiplataform
//
//  Created by Leonardo Gomes on 26/05/21.
//swiftlint:disable control_statement

import SwiftUI

struct NotificationCell: View {
    
    var period: String = ""
    @State var alarmMode: Bool = false
    @Binding var notificationBool: Bool
    
    let notificationsManager = NotificationManager.shared
    @Binding var value: Int
    let notificationType: NotificationType
    
    var body: some View {
        let toggle = Toggle("Notificações \(period)", isOn: $notificationBool)
            .toggleStyle(SwitchToggleStyle(tint: .actionPurple)).onChange(of: notificationBool, perform: { bool in
                if (bool) {
                    UserDefaults.standard.setValue(true, forKey: "notificationBool")
                    if value == 0 {
                        value = 1
                    }
                    notificationsManager.setTimeOfNotification(ofType: notificationType, minutes: Double(value))
                    notificationsManager.activateNotification(ofType: notificationType)
                } else {
                    UserDefaults.standard.setValue(false, forKey: "notificationBool")
                    notificationsManager.deactivateNotification(ofType: notificationType)
                }
            })
        
        HStack {
            if alarmMode {
                toggle.foregroundColor(.blue)
//                notificationsManager.setTimeOfNotification(ofType: .exercise, minutes: Double(value))
//                notificationsManager.activateNotification(ofType: .exercise)
                
            } else {
                toggle.foregroundColor(.white)
            }
        }
    }
}

//struct NotificationCell_Previews: PreviewProvider {
//    static var previews: some View {
//        NotificationCell()
//    }
//}
