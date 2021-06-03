//
//  InitialView.swift
//  watchOS WatchKit Extension
//
//  Created by Jhennyfer Rodrigues de Oliveira on 21/05/21.
//

import Foundation
import SwiftUI

struct ExerciseCellWatch: View {
    var cardIndex: Int
    var category: Category
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 2.0) {
                Text(verbatim: category.name)
                    .font(.system(.title3, design: .rounded))
                    .foregroundColor(.white)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .lineLimit(2)
                
                Text("\(category.totalOfExercisesInCategory) Exercícios")
                    .font(.system(.body, design: .rounded))
                    .foregroundColor(.white)
                    .fontWeight(.regular)
                    .lineLimit(1)
                
                Text(String(format: "%.0f", category.exerciseDurationInCategory) + " min" )
                    .font(.system(.body, design: .rounded))
                    .foregroundColor(.white)
                    .fontWeight(.regular)
                    .lineLimit(1)
            }
            .frame(width: 125, height: 110, alignment: .leading)
            .padding(.bottom, 20)
            .padding([.leading, .top], 12.0)
            .offset(x: -15)
            
            category.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 30)
                .padding(.top, 36.0)
                .padding(.bottom, 12.0)
                .offset(x: 55)
        }
        .frame(width: 164, height: 118)
        .modifier(CardModifier())
    }
}
