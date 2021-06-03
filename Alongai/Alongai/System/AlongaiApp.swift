//
//  MultiplataformApp.swift
//  Multiplataform
//
//  Created by Brena Amorim on 20/05/21.
//

import SwiftUI

@main
struct MultiplataformApp: App {
//    let persistenceController = PersistenceController.shared

    let notificationsManager = NotificationManager.shared
    
    init() {
        notificationsManager.requestPermissions()
    }
    
    var body: some Scene {
        WindowGroup {
//            ExerciseiOSView(viewModel: ExerciseViewModel(), adjustViewModel: AdjustExerciseViewModel())
            InitialView()
            
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
