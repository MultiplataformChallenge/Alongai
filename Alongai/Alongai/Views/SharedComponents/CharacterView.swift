//
//  CharacterView.swift
//  Multiplataform
//
//  Created by Brena Amorim on 26/05/21.
//

import SwiftUI

struct CharacterView: View {
    var image: Image
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geometry.size.width * 0.24, height: geometry.size.height * 0.24 * 2.19)
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}

struct CharacterView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterView(image: Image("alongamentoColunaEPosteriorCoxa"))
    }
}
