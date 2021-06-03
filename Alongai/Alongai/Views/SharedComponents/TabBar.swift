//
//  TabBar.swift
//  Multiplataform
//
//  Created by Jhennyfer Rodrigues de Oliveira on 26/05/21.
//

import SwiftUI

struct TabBar: View {
    @Binding var rootIsActive: Bool
    var exerciseViewModel: ExerciseViewModel
    var targetCount: CGFloat

    var body: some View {
        TabView {
            ExerciseViewWatch(viewModel: exerciseViewModel, targetCount: CGFloat(exerciseViewModel.currentTime))
            ConfigExerciseView(viewModel: AdjustExerciseViewModel(), rootIsActive: $rootIsActive)
        }
        .tabViewStyle(PageTabViewStyle())
    }
}
