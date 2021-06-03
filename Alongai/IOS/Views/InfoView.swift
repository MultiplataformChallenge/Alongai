//
//  InfoView.swift
//  Multiplataform
//
//  Created by Brena Amorim on 27/05/21.
//

import SwiftUI

struct InfoView: View {
    @State var isModalVisible = false
    
    var body: some View {
        ZStack {
            Button(action: {
                isModalVisible.toggle()
            }, label: {
                Text("Show modal")
                    .frame(width: 120, height: 60)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            })
            
            if isModalVisible {
//                ModalView(isVisible: $isModalVisible)
            }
        }
    }
}

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
//            Color.primary.opacity(0.3)
//                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Text("Info")
                        .font(Font.system(size: 17, weight: .semibold, design: .rounded))
                        .padding(.leading, 160)
                    
                    Spacer()
                    
                    Button(action: {
                        toggleVisible()
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "xmark")
                            .foregroundColor(Color.lightPurple)
                            .padding(8)
                            .background(Color(UIColor.systemBackground))
                            .clipShape(Circle())
                            .shadow(radius: 3)
                    })
                }
                
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
                    
                    Divider()
                    
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
            .frame(maxWidth: .infinity, alignment: .bottom)
            .edgesIgnoringSafeArea(.all)
            .padding()
            .background(Color(UIColor.secondarySystemBackground))
            .cornerRadius(15)
            .padding()
        }
    }
    
    func toggleVisible() {
        isVisible.toggle()
    }
}

//struct ModalView_Previews: PreviewProvider {
//    static var previews: some View {
//        ModalView(isVisible: <#Binding<Bool>#>, exerciseName: <#String#>, description: <#String#>, time: <#Int#>, repetitions: <#Int#>)
//            .preferredColorScheme(.dark)
//    }
//}
