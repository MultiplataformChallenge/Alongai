//
//  NameCell.swift
//  Multiplataform
//
//  Created by Leonardo Gomes on 26/05/21.
//

import SwiftUI

struct NameCell: View {
    
    var nameCell: String
    var imageName: String
    
    var body: some View {
        
        ZStack {
            HStack {
                Text(nameCell)
                    .font(.system(size: 22, weight: .bold, design: .rounded))
                Spacer()
                Image(imageName)
                    .scaledToFit()
                    .scaleEffect(0.7)
            }
            
            //            .background(AngularGradient(gradient: Gradient(colors: [.purpleDark, .purpleLight]),center: .center, startAngle: .zero ,endAngle: .degrees(90)))
            .background(LinearGradient(gradient: Color.gradient, startPoint: .topLeading, endPoint: .bottom)
                            .padding(.horizontal, -20)
                            .padding(/*@START_MENU_TOKEN@*/.vertical, -5.0/*@END_MENU_TOKEN@*/))
        }
        
    }
}

struct NameCell_Previews: PreviewProvider {
    static var previews: some View {
        NameCell(nameCell: "Água", imageName: "Glass")
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}
