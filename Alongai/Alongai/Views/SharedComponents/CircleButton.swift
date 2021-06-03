//
//  CircleButton.swift
//  Multiplataform
//
//  Created by Brena Amorim on 26/05/21.
//

import SwiftUI

struct CircleButton: View {
    let imageName: String
    let size: Float
    let fontSize: Int
    let action: () -> Void
    
    let hasImage: Bool
//    @Binding var isActive: Bool
    
    var body: some View {
        Button(action: action) {
            VStack {
                if hasImage {
                    Image(systemName: imageName)
                        .padding()
                        .frame(width: CGFloat(size), height: CGFloat(size))
                        .background(LinearGradient(gradient: Color.gradient, startPoint: .top, endPoint: .bottom))
                        .clipShape(Circle())
                        .font(Font.system(size: CGFloat(fontSize), weight: .black, design: .rounded))
                        .foregroundColor(.white)
                }
            }
        }
//        .onTapGesture {
//            self.isActive.toggle()
//        }
        .frame(width: CGFloat(size), height: CGFloat(size))
        .padding()
    }
}

func printSomething() {
    
}

//struct CircleButton_Previews: PreviewProvider {
//    static var previews: some View {
//        CircleButton(imageName: "pause", size: 55, fontSize: 30, action: {print("pressed")}, hasImage: true)
//    }
//}
