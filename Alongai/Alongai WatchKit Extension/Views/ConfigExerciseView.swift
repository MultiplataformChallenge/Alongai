//
//  ConfigExerciseView.swift
//  watchOS WatchKit Extension
//
//  Created by Brena Amorim on 26/05/21.
//

import SwiftUI

struct ConfigExerciseView: View {
    @ObservedObject var viewModel: AdjustExerciseViewModel
    @Binding var rootIsActive: Bool
    @State var isPlaying: Bool = false

    var body: some View {
        VStack(spacing: 8) {
            HStack {
                VStack {
                    // pause
                    Button(action: {
                        viewModel.pause()
                       self.isPlaying.toggle()
                    }) {
                        Image(systemName: self.isPlaying == true ? "play.fill" : "pause")
                            .padding()
                            .frame(width: 52, height: 52)
                            .background(LinearGradient(gradient: Color.gradient, startPoint: .top, endPoint: .bottom))
                            .clipShape(Circle())
                            .font(Font.system(size: 30, weight: .black, design: .rounded))
                            .foregroundColor(.white)
                    }
                    .frame(width: 52, height: 52)
                    .padding()

                    Text(self.isPlaying == true ? "Continuar" : "Pausar")
                        .font(.caption2)
                        .foregroundColor(.white)
                        .offset(y: -8)
                }
                VStack {
                    CircleButton(imageName: "xmark", size: 52, fontSize: 30, action: { viewModel.finish()
                        self.rootIsActive = false
                    }, hasImage: true)
                    //                    .buttonStyle(BorderedButtonStyle(tint: .black))
                    //                    .overlay(
                    //                        Image(systemName: self.viewModel.finishActive ? "xmark" : "play")
                    //                            .padding()
                    //                            .frame(width: CGFloat(55), height: CGFloat(55))
                    //                            .font(Font.system(size: CGFloat(30), weight: .black, design: .rounded))
                    //                            .foregroundColor(.white)
                    //                    )
                    Text("Encerrar")
                        .font(.caption2)
                        .foregroundColor(.white)
                        .offset(y: -8)
                }
            } .offset(y: 16)
            HStack {
                VStack {
                    CircleButton(imageName: "backward.fill", size: 52, fontSize: 24, action: { viewModel.back()}, hasImage: true)
                    //                    .buttonStyle(BorderedButtonStyle(tint: .black))
                    Text("Anterior")
                        .font(.caption2)
                        .foregroundColor(.white)
                        .offset(y: -8)
                }
                VStack {
                    CircleButton(imageName: "forward.fill", size: 52, fontSize: 24, action: { viewModel.foward()}, hasImage: true)
                    //                    .buttonStyle(BorderedButtonStyle(tint: .black))
                    Text("Próximo")
                        .font(.caption2)
                        .foregroundColor(.white)
                        .offset(y: -8)
                }
            }
        }
    }
    
}
