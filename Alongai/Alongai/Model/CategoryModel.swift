//
//  CategoryModel.swift
//  Multiplataform
//
//  Created by Jhennyfer Rodrigues de Oliveira on 25/05/21.
//

import Foundation
import SwiftUI

struct Category {
    var name: String
    var exerciseDurationInCategory: Float
    var totalOfExercisesInCategory: Int
    var image: Image
    var exercises: [ExerciseModel]
    
    init(name: String = "", exerciseDurationInCategory: Float = 0, totalOfExercisesInCategory: Int = 0, image: Image = Image("a")) {
        self.name = name
        self.exerciseDurationInCategory = exerciseDurationInCategory
        self.totalOfExercisesInCategory = totalOfExercisesInCategory
        self.image = image
        self.exercises = []
    }
}
