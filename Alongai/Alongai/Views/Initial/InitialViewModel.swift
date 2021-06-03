//
//  InitialViewModel.swift
//  Multiplataform
//
//  Created by Brena Amorim on 20/05/21.
//

import Foundation
import SwiftUI

class InitialViewModel {

    var categories: [Category] = []
    var allCategory: Category = Category(name: "Alongamento completo", image: Image("a"))
    var armCategory: Category = Category(name: "Alongamento de braço", image: Image("alongamentoPulsoEsquerdaBaixo"))
    var headCategory: Category = Category(name: "Alongamento de cabeça", image: Image("alongamentoPescocoEsquerda"))
    var legCategory: Category = Category(name: "Alongamento de perna", image: Image("alongamentoFrontalCoxaEsquerdaTras"))
    var spineCategory: Category = Category(name: "Alongamento de coluna", image: Image("alongamentoColunaEPosteriorCoxa"))
    var pectoralCategory: Category = Category(name: "Alongamento do peitoral", image: Image("alongamentoPeitoral"))
    
    init() {
        filterExercises()
    }
    
    func populateCategoriesArray() {
        categories.append(allCategory)
        categories.append(armCategory)
        categories.append(headCategory)
        categories.append(spineCategory)
        categories.append(legCategory)
        categories.append(pectoralCategory)
    }
     
    func populateCategory(category: inout Category, index: Int) {
        category.exercises.append(exercises[index])
        category.totalOfExercisesInCategory += 1
        category.exerciseDurationInCategory += Float(exercises[index].timesOfRepetition * exercises[index].duration + exercises[index].restTimeBetweenDifferentExercises)
        
        if exercises[index].timesOfRepetition > 1 {
            category.exerciseDurationInCategory += Float(exercises[index].timesOfRepetition * exercises[index].restTimeBetweenSameExercise - exercises[index].restTimeBetweenSameExercise)
        }
        
    }
    
    func transformSecondToMinute(categories: inout [Category]) {
        for index in 0...categories.count - 1 {
            categories[index].exerciseDurationInCategory /= 60
            categories[index].exerciseDurationInCategory = categories[index].exerciseDurationInCategory.rounded()
        }
    }

    func filterExercises() {
        for index in 0...exercises.count - 1 {
            if exercises[index].category == "braço" {
                populateCategory(category: &armCategory, index: index)
            } else if exercises[index].category == "perna" {
                populateCategory(category: &legCategory, index: index)
            } else if exercises[index].category == "cabeça" {
                populateCategory(category: &headCategory, index: index)
            } else if exercises[index].category == "coluna" {
                populateCategory(category: &spineCategory, index: index)
            } else if exercises[index].category == "peitoral" {
                populateCategory(category: &pectoralCategory, index: index)
            }
            populateCategory(category: &allCategory, index: index)
        }
        populateCategoriesArray()
        transformSecondToMinute(categories: &categories)
             
    }
}
