//
//  ExerciseModel.swift
//  Multiplataform
//
//  Created by Brena Amorim on 20/05/21.
//

import Foundation
import SwiftUI

struct ExerciseModel: Codable {
    var identifier: Int
    var name: String
    var category: String
    var duration: Int
    var timesOfRepetition: Int
    var restTimeBetweenSameExercise: Int
    var restTimeBetweenDifferentExercises: Int
    var description: String
    
    private var image: String
    var imageExercise: Image {
        Image(image)
    }
    
}
