//
//  InfoView.swift
//  Multiplataform
//
//  Created by Brena Amorim on 27/05/21.
//

import SwiftUI

struct ModalView: View {
    @Environment(\.presentationMode) var presentationMode
    
    //    @State var isVisible: Bool = true
    
    @Binding var isVisible: Bool
    
    @State var exerciseName: String
    @State var description: String
    @State var time: Int
    @State var repetitions: Int
    
    var body: some View {
        
        ZStack {
            VStack {
                VStack(alignment: .leading) {
                    Text("\(exerciseName)")
                        .font(Font.system(size: 22, weight: .bold, design: .rounded))
                        .multilineTextAlignment(.leading)
                        .padding(.top, 16)
                    
                    Text("\(description)")
                        .font(Font.system(size: 18, weight: .medium, design: .rounded))
                        .multilineTextAlignment(.leading)
                        .padding(.top, -4)
                }
                
                HStack {
                    VStack {
                        HStack {
                            Text("\(time)")
                                .font(Font.system(size: 30, weight: .medium, design: .rounded))
                            
                            Image(systemName: "stopwatch.fill")
                                .font(Font.system(size: 18, weight: .bold, design: .rounded))
                            Divider()
                        }
                        .frame(width: 90, height: 31)
                        
                        Text("Segundos")
                            .font(Font.system(size: 18, weight: .medium, design: .rounded))
                            .offset(y: -8)
                    } .frame(width: 86, height: 67)
                    
                    Divider().background(Color.white)
                    
                    VStack {
                        HStack {
                            Text("\(repetitions)")
                                .font(Font.system(size: 30, weight: .medium, design: .rounded))
                            
                            Text("x")
                                .font(Font.system(size: 30, weight: .bold, design: .rounded))
                            
                            Divider()
                        }
                        .frame(width: 90, height: 31)
                        
                        Text("Repetições")
                            .font(Font.system(size: 18, weight: .medium, design: .rounded))
                            .offset(y: -8)
                    } .frame(width: 100, height: 67)
                    
                }.frame(width: 202, height: 67)
                
            }
            .navigationBarTitle("Info", displayMode: .inline)
            // Navbar item
            .toolbar {
              ToolbarItem(placement: ToolbarItemPlacement.confirmationAction) {
                Button("OK") {
                    self.presentationMode.wrappedValue.dismiss()
                }
              }
            }
            .frame(maxWidth: .infinity, alignment: .bottom)
            .edgesIgnoringSafeArea(.all)
            .padding()
            .cornerRadius(15)
            .padding()
        }
    }
    
    func toggleVisible() {
        isVisible.toggle()
    }
}
