//
//  CardModifier.swift
//  Multiplataform
//
//  Created by Jhennyfer Rodrigues de Oliveira on 21/05/21.
//

import Foundation
import SwiftUI

struct CardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, alignment: .center)
            .background(LinearGradient(gradient: Color.gradient, startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(20)
    }
}
