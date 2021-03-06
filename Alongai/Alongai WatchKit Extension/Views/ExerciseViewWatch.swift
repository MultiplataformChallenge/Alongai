//
//  ExerciseViewWatch.swift
//  watchOS WatchKit Extension
//
//  Created by Brena Amorim on 26/05/21.
//

import SwiftUI

struct ExerciseViewWatch: View {
    @ObservedObject var viewModel: ExerciseViewModel
    //centésimos de segundos
    let timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()

    // timer config
    @State private var index: Int = 0
    @State var targetCount: CGFloat
    @State private var isFinished = false

    //segundos timer
    @State private var counter: CGFloat = 0

    // config exercise
    @State private var pause = false
    @State private var finish = false
    @State private var back = false
    @State private var forward = false

    var body: some View {
        NavigationView {
            VStack {
                CharacterView(image: viewModel.currentExercises[index].imageExercise)
                    .offset(y: 8)
                ZStack {
                    TimerView(size: 60, fontSize: 24, progress: counter/targetCount, targetCount: $targetCount, counter: $counter)
                        .offset(y: 16)
                }.onReceive(timer) { _ in
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

//                                break
                            case .pause:
                                print("Pause")
                                // Change for exercise
                                counter = 0
                                viewModel.timerState = .exercise
                                targetCount = CGFloat(viewModel.currentExercises[index].duration)

//                                break
                            case .rest:
                                print("Rest")
                                print(viewModel.currentExercises[index].name)
                                print(index)
                                // Change for end
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
//                                break
                            case .end:
                                if isFinished {
                                    print("End")
                                    isFinished.toggle()
                                }
//                                break
                            }
                        }
                    }
                }
            }
            .navigationTitle("\(index + 1) de \(viewModel.numberOfExercises)")
        }
    }
}

