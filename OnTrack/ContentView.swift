//
//  ContentView.swift
//  OnTrack
//
//  Displays a summary of the user's routines and allows the user to
//  check them off.
//
//  Created by Enam Amevo on 3/28/24.
//
//  Contributors:
//
    
import SwiftUI

struct ContentView: View {
    @EnvironmentObject var vm: ViewModel
    @State var numComplete: Int = 0
    
    var list: [String] = ["Hello", "World"]
    
    // State vars which manage whether add/selected view is visible
    @State var selectedRoutineViewVisible = false
    @State var addRoutineViewVisible = false
    @State var onboardingViewVisible = false
    
    var body: some View {
        VStack {
            HStack {
                Text("Hello, \(vm.name)")
                    .bold()
                    .font(.title)
                Spacer()
                Button(action: {
                    // setting this to true makes the sheet pop up
                    addRoutineViewVisible = true
                    print(vm.name)
                }) {
                    Image(systemName: "plus")
                }.sheet(isPresented: $addRoutineViewVisible, content: {
                    // present AddRoutineView when button clicked
                    AddRoutineView()
                        .onDisappear() { // when view disappears, reset bool
                        addRoutineViewVisible = false
                    }
                })
            }
            .padding(EdgeInsets(top: 16, leading: 16, bottom: 4, trailing: 16))
            
            
            Text(vm.getDailyQuote())
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 16))
                .italic()
                .foregroundStyle(.gray)
            
            List() {
                ForEach(vm.routines) { (routine: Routine) in
                    HStack {
                        
                        Button(action: {
                            vm.markRoutine(routine: routine)
                            numComplete = 0
                            for aRoutine in vm.routines {
                                if (vm.routineIsComplete(routine: aRoutine)) {
                                    numComplete += 1
                                }
                            }
                        }) {
                            Image(systemName: vm.routineIsComplete(routine: routine) ? "checkmark.square" : "square")
                                .font(.system(size: 24))
                                .foregroundStyle(.blue)
                        }
                        // prevents whole list from being clickable
                        .buttonStyle(PlainButtonStyle())
                        
                        Spacer()
                        VStack {
                            Text(routine.title)
                                .bold()
                            Text(routine.description)
                            Text(frequency(for: routine.frequency))
                                .italic()
                        }
                        Spacer()
                        Button(action: {
                            // setting this to true makes the sheet pop up
                            vm.selectedRoutine = routine
                            selectedRoutineViewVisible = true
                        }) {
                            Image(systemName: "info.circle")
                                .font(.system(size: 24))
                                .foregroundStyle(.blue)
                        }
                        .sheet(isPresented: $selectedRoutineViewVisible, content: {
                            SelectedRoutineView()
                                .onDisappear() { // when view disappears, reset bool
                                selectedRoutineViewVisible = false
                            }
                        })
                        // prevents whole list from being clickable
                        .buttonStyle(PlainButtonStyle())
                    }
                }
            }
            if numComplete < vm.routines.count {
                Text("On track with \(numComplete) of \(vm.routines.count) routines")
                    .padding()
            } else {
                Text("On track with all routines!")
                    .padding()
                    .foregroundStyle(.green)
                    .bold()
            }
            
        }.sheet(isPresented: $onboardingViewVisible, content: {
            OnboardingView()
        })
        .onAppear() {
            onboardingViewVisible = !vm.isOnboarded
        }
    }

    func frequency(for frequency: Int) -> String {
            switch frequency {
            case 86400:
                return "Daily task"
            case 604800:
                return "Weekly task"
            case 2592000:
                return "Monthly task"
            default:
                return "Custom task"
            }
        }
}

#Preview {
    ContentView().environmentObject(ViewModel())
}
