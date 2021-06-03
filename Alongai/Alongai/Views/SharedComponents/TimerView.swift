//
//  TimerView.swift
//  Multiplataform
//
//  Created by Brena Amorim on 26/05/21.
//

import SwiftUI

struct TimerView: View {
    
    let size: CGFloat
    let fontSize: CGFloat
    var baseColor =  Color.gradient
    var progress: CGFloat

    @Binding var targetCount: CGFloat //segundos timer
    @Binding var counter: CGFloat
    
    var body: some View {
        ZStack {
            // Timer background
            Circle()
                .stroke(Color.white, style: .init(lineWidth: 5, lineCap: .round, lineJoin: .round))
                .opacity(0.9)
                .frame(width: size, height: size)
           
            // Timer progress
            Circle()
                .trim(from: progress, to: 1)
                .stroke(LinearGradient(gradient: baseColor, startPoint: .leading, endPoint: .trailing), style: .init(lineWidth: 5, lineCap: .round, lineJoin: .round))
                .frame(width: size, height: size)
                .rotationEffect(.degrees(90))
                .rotation3DEffect(
                    .degrees(180),
                    axis: (x: 1.0, y: 0.0, z: 0.0)
                    )
            
            //Time
            let timeLeft = Int(targetCount - counter)
            Text("\(timeLeft)")
                .font(Font.system(size: fontSize, weight: .black, design: .rounded))
                .font(.largeTitle)
                .foregroundColor(.white)
        }
    }
}
