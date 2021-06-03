//
//  ColorExtension.swift
//  Multiplataform
//
//  Created by Brena Amorim on 20/05/21.
//

import Foundation
import SwiftUI

extension Color {
    static let darkPurple = Color.init(.sRGB, red: 86/255, green: 11/255, blue: 173/255, opacity: 1)
    static let lightPurple = Color.init(.sRGB, red: 94/255, green: 29/255, blue: 235/255, opacity: 1)
    static let actionPurple = Color.init(.sRGB, red: 153/255, green: 108/255, blue: 241/255, opacity: 1)
    static let gradient = Gradient(colors: [Color.darkPurple, Color.lightPurple])
}
