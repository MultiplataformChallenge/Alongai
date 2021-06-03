//
//  JourneyPickerCell.swift
//  Multiplataform
//
//  Created by Leonardo Gomes on 26/05/21.
//

import SwiftUI

struct JourneyPickerCell: View {
    
    var labelJorney: String
    
    @State private var wakeUp = Date()
    
    var body: some View {
        VStack {
            DatePicker("\(labelJorney) da jornada", selection: $wakeUp, displayedComponents: .hourAndMinute)
                .accentColor(.actionPurple)
        }
    }
}

struct TimerPickerCell_Previews: PreviewProvider {
    static var previews: some View {
        JourneyPickerCell(labelJorney: "Ínicio")
        JourneyPickerCell(labelJorney: "Fim")
    }
}
