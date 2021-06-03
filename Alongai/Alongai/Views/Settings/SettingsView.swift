//
//  SettingsView.swift
//  Multiplataform
//
//  Created by Brena Amorim on 20/05/21.
//swiftlint:disable multiple_closures_with_trailing_closure control_statement

import SwiftUI

struct SettingsView: View {

    @Environment(\.presentationMode) var presentationMode
    @Binding var showSheetView: Bool
    @State var notificationBool: Bool = UserDefaults.standard.bool(forKey: "notificationBool")
    
    let notificationsManager = NotificationManager.shared
    @State var value: Int = UserDefaults.standard.integer(forKey: "valueExercices")
    
    var body: some View {
        
        let saveButton = Button(action: {
            self.showSheetView = false
        }) {
            Text("Salvar").bold()
        }
        .foregroundColor(.actionPurple)
        
        let cancelButton =  Button(action: {
            self.showSheetView = false
        }) {
            Text("Cancelar").bold()
        }
        .foregroundColor(.actionPurple)
        
        NavigationView {
            //            Text("List of notifications")
            List {
//                NameCell(nameCell: "Água", imageName: "Glass")
//                NotificationCell(period: "pela manhã")
//                NotificationCell()
//                NameCell(nameCell: "Postura", imageName: "Chair")
//                NotificationCell()
//                JourneyPickerCell(labelJorney: "Início")
                NameCell(nameCell: "Exercícios", imageName: "StandUP")
                NotificationCell(notificationBool: $notificationBool, value: $value, notificationType: .exercise)

                Stepper("Intervalo entre notificações:\n\(value) minuto(s)", value: $value, in: 1...120).onChange(of: value) { value in
                    UserDefaults.standard.setValue(value, forKey: "valueExercices")
                    if (notificationBool) {
                        notificationsManager.updateNotification(ofType: .exercise, minutes: Double(value))
                        
                    }
                }
            }
            
            .edgesIgnoringSafeArea(.all)
            .preferredColorScheme(.dark)
            .navigationBarTitle(Text("Configurações"), displayMode: .inline)
            .navigationBarItems(leading: cancelButton, trailing: saveButton)
        }
        
    }
}

//struct SettingsView_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingsView()
//    }
//}
