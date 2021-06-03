//
//  AdjustExerciseViewModel.swift
//  Multiplataform
//
//  Created by Brena Amorim on 26/05/21.
//

import Combine
import Foundation

final class AdjustExerciseViewModel: ObservableObject, Identifiable {
    
    init() {
        UserDefaults.standard.setValue(false, forKey: "isPaused")
        UserDefaults.standard.setValue(false, forKey: "isFinished")
        UserDefaults.standard.setValue(false, forKey: "back")
        UserDefaults.standard.setValue(false, forKey: "forward")
    }
    
    func pause() {
        if UserDefaults.standard.bool(forKey: "isPaused") {
            UserDefaults.standard.setValue(false, forKey: "isPaused")
        } else {
            UserDefaults.standard.setValue(true, forKey: "isPaused")
        }
        
        if UserDefaults.standard.bool(forKey: "isFinished") {
            UserDefaults.standard.setValue(false, forKey: "isFinished")
        }
    }

    func finish() {
        UserDefaults.standard.setValue(true, forKey: "isFinished")
    }

    func back() {
        UserDefaults.standard.setValue(true, forKey: "back")
        
        if UserDefaults.standard.bool(forKey: "isFinished") {
            UserDefaults.standard.setValue(false, forKey: "isFinished")
        }
    }

    func foward() {
        UserDefaults.standard.setValue(true, forKey: "forward")
        
        if UserDefaults.standard.bool(forKey: "isFinished") {
            UserDefaults.standard.setValue(false, forKey: "isFinished")
        }
    }

}
