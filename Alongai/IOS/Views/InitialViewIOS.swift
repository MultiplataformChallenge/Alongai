//
//  InitialViewIOS.swift
//  watchOS WatchKit Extension
//
//  Created by Jhennyfer Rodrigues de Oliveira on 21/05/21.
//

import Foundation
import SwiftUI

struct ExerciseCellIOS: View {
    var cardIndex: Int
    var category: Category
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 8.0) {
                Text(verbatim: category.name)
                    .font(.system(.largeTitle, design: .rounded))
                    .foregroundColor(.white)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .lineLimit(2)
                    
                Text("\(category.totalOfExercisesInCategory) Exercícios")
                    .font(.system(.title2, design: .rounded))
                    .foregroundColor(.white)
                    .fontWeight(.regular)
                    .lineLimit(1)
                
                Text(String(format: "%.0f", category.exerciseDurationInCategory) + " min" )
                    .font(.system(.title3, design: .rounded))
                    .foregroundColor(.white)
                    .fontWeight(.regular)
                    .lineLimit(1)
            }
            .frame(width: 230, height: 300, alignment: .topLeading)
            .padding(.bottom, 20)
            .padding([.top, .leading], 24.0)
            .offset(x: -70)
            
            category.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 150)
                .frame(maxHeight: 150)
                .padding(.top, 36.0)
                .padding(.bottom, 12.0)
                .padding(.trailing, 24)
                .offset(x: 110)
        }
        .frame(width: 358, height: 366)
//        .frame(maxWidth: 358, maxHeight: 366)
        .modifier(CardModifier())
        .padding([.all], 10)
    }
}
