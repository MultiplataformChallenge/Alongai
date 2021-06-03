//
//  ExerciseiOSView.swift
//  Multiplataform
//
//  Created by Brena Amorim on 26/05/21.
//

import SwiftUI

struct ExerciseiOSView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var viewModel: ExerciseViewModel
    @ObservedObject var adjustViewModel: AdjustExerciseViewModel
    
    // info
    @State var isModalVisible = false
    
    @State private var showingSheet = false
    // quit
    @Binding var exerciseIsActive: Bool
    
    // centésimos de segundos
    let timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    @State private var nameOfExercise: String = ""
    
    // timer config
    @State private var index: Int = 0
    @State var targetCount: CGFloat
    @State private var isFinished = false
    
    //segundos timer
    @State private var elapsedTime: CGFloat = 0
    @State private var counter: CGFloat = 0
    
    // config exercise
    //    @State private var pause = false
    //    @State private var finish = false
    //    @State private var back = false
    //    @State private var forward = false
    
    func printInfo() {
        print("info")
    }
    
    var body: some View {
        Color.black
            .ignoresSafeArea(.all) // Ignore just for the color
            .overlay(
                
                VStack {
                    HStack(alignment: .top) {
                        VStack(alignment: .leading) {
                            HStack {
                                Text("\(viewModel.currentExercises[index].name)")
                                    .font(Font.system(size: 22, weight: .bold, design: .rounded))
                                    .foregroundColor(.white)
                                    .lineLimit(3)
                                
                            } .frame(maxWidth: 300, alignment: .leading)
                            
                            Text("\(index + 1) de \(viewModel.currentExercises.count)")
                                .font(Font.system(size: 18, weight: .medium, design: .rounded))
                                .foregroundColor(.white)
                            
                            Text("Tempo Total")
                                .font(Font.system(size: 22, weight: .bold, design: .rounded))
                                .foregroundColor(.white)
                            
                            Text("\(Int(elapsedTime/60)):\(Int(elapsedTime + 1))")
                                .font(Font.system(size: 18, weight: .medium, design: .rounded))
                                .foregroundColor(.white)
                        }
//                        isModalVisible.toggle()
                        CircleButton(imageName: "info", size: 21, fontSize: 15, action: {showingSheet.toggle()}, hasImage: true)
                            .sheet(isPresented: $showingSheet) {
                                ModalView(isVisible: $isModalVisible, exerciseName: viewModel.currentExercises[index].name, description: viewModel.currentExercises[index].description, time: viewModel.currentExercises[index].duration, repetitions: viewModel.currentExercises[index].timesOfRepetition)
                                    .preferredColorScheme(.dark)
                            }
                            .frame(width: 21, height: 21)
                            .offset(x: -20, y: 6)
                            
                        CircleButton(imageName: "xmark", size: 60, fontSize: 27, action: { self.presentationMode.wrappedValue.dismiss() }, hasImage: true)
                            .frame(width: 60, height: 60)
                            .offset(x: 0)
                    }
                    
                    VStack {
                        viewModel.currentExercises[index].imageExercise
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 250)
                            .frame(maxHeight: 250)
                    }
                    
                    VStack {
                        TimerView(size: 150, fontSize: 64, progress: counter/targetCount, targetCount: $targetCount, counter: $counter)
                            .offset(y: 32)
                        HStack(alignment: .top) {
                            CircleButton(imageName: "backward.fill", size: 70, fontSize: 30, action: {adjustViewModel.back()}, hasImage: true)
                                .frame(width: 60, height: 60)
                                .offset(x: -32, y: 8)
                            CircleButton(imageName: "pause", size: 70, fontSize: 38, action: {adjustViewModel.pause()}, hasImage: true)
                                .padding(.top, 38)
                            CircleButton(imageName: "forward.fill", size: 70, fontSize: 30, action: {adjustViewModel.foward()}, hasImage: true)
                                .frame(width: 60, height: 60)
                                //                            .padding(.trailing, 32)
                                .offset(x: 32, y: 8)
                        }
                    }
                }).onReceive(timer) { _ in
                    // Timer runs if have repetitions
                    if viewModel.repetition >= 0 {
                        if counter <= targetCount {
                            // Verify if is Finished
                            if UserDefaults.standard.bool(forKey: "isFinished") == false {
                                // Verify if back
                                if UserDefaults.standard.bool(forKey: "back") == false {
                                    // Verify if foward
                                    if UserDefaults.standard.bool(forKey: "forward") == false {
                                        // Verify if is Paused
                                        if UserDefaults.standard.bool(forKey: "isPaused") == false {
                                            self.counter += 0.01
                                            self.elapsedTime += 0.01
                                        } else {
                                            // pause
                                            //                                            print("Exercise paused")
                                        }
                                    } else {
                                        // foward
                                        if viewModel.currentExercises.count == 1 || (index + 1) > (viewModel.currentExercises.count - 1) {
                                            // finish
                                            UserDefaults.standard.setValue(false, forKey: "forward")
                                            UserDefaults.standard.setValue(true, forKey: "isFinished")
                                        } else if (index + 1) <= (viewModel.currentExercises.count - 1) {
                                            print((index + 1))
                                            index += 1
                                            self.counter = 0
                                            targetCount = CGFloat(viewModel.currentExercises[index].duration)
                                            viewModel.timerState = .exercise
                                            viewModel.repetition = viewModel.currentExercises[index].timesOfRepetition
                                            UserDefaults.standard.setValue(false, forKey: "forward")
                                        }
                                    }
                                } else {
                                    // back
                                    if index == 0 {
                                        index = 0
                                        self.counter = 0
                                        targetCount = CGFloat(viewModel.currentExercises[index].duration)
                                        viewModel.timerState = .exercise
                                        viewModel.repetition = viewModel.currentExercises[index].timesOfRepetition
                                        UserDefaults.standard.setValue(false, forKey: "back")
                                    } else if ((viewModel.currentExercises.count - 1) - (index - 1)) > 0 {
                                        print((index - 1))
                                        index -= 1
                                        self.counter = 0
                                        targetCount = CGFloat(viewModel.currentExercises[index].timesOfRepetition)
                                        viewModel.timerState = .exercise
                                        viewModel.repetition = viewModel.currentExercises[index].timesOfRepetition
                                        UserDefaults.standard.setValue(false, forKey: "back")
                                    }
                                }
                            } else {
                                // finished
                                self.counter = targetCount
                                viewModel.timerState = .end
                            }
                        } else {
                            // Timer states
                            switch viewModel.timerState {
                            case .exercise:
                                print("Exercise")
                                counter = 0
                                // Change for rest
                                if viewModel.repetition == 1 {
                                    viewModel.timerState = .rest
                                    targetCount = CGFloat(viewModel.currentExercises[index].restTimeBetweenDifferentExercises)
                                }
                                // Change for time between exercises
                                else {
                                    viewModel.timerState = .pause
                                    targetCount = CGFloat(viewModel.currentExercises[index].restTimeBetweenSameExercise)
                                }
                                viewModel.repetition -= 1
                                
                            case .pause:
                                print("Pause")
                                // Change for exercise
                                counter = 0
                                viewModel.timerState = .exercise
                                targetCount = CGFloat(viewModel.currentExercises[index].duration)
                                
                            case .rest:
                                print("Rest")
                                print(viewModel.currentExercises[index].name)
                                print(index)
                                counter = 0
                                if (index + 1) < (viewModel.numberOfExercises - 1) {
                                    index += 1
                                    viewModel.timerState = .exercise
                                    viewModel.repetition = viewModel.currentExercises[index].timesOfRepetition
                                    targetCount = CGFloat(viewModel.currentExercises[index].duration)
                                } else {
                                    targetCount = CGFloat(0)
                                    isFinished.toggle()
                                    viewModel.timerState = .end
                                }
                            case .end:
                                if isFinished {
                                    print("End")
                                    isFinished.toggle()
                                }
                            }
                        }
                    }
                }
            .navigationBarHidden(true)
//                if isModalVisible {
//                    sheet(isPresented: $isModalVisible, content: {
//                        ModalView(isVisible: $isModalVisible, exerciseName: viewModel.currentExercises[index].name, description: viewModel.currentExercises[index].description, time: viewModel.currentExercises[index].duration, repetitions: viewModel.currentExercises[index].timesOfRepetition)
//                            .preferredColorScheme(.dark)
//                    })
//                }
    }
}
