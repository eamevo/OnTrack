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
    var numComplete: Int = 0
    
    var body: some View {
        VStack {
            Text("Hello, \(vm.getDailyQuote())")
                .padding()
            
            Text(vm.getDailyQuote())
                .padding()
            
            List(vm.routines) { routine in
                HStack {
                    Button(action: vm.markRoutine()) {
                        Image(systemName: routine.isCompleted ? "checkmark.square" : "square")
                    }
                    Spacer()
                    VStack {
                        Text(routine.name)
                        Text(routine.description)
                    }
                }
            }
            
            Button(action: vm.addRoutine()) {
                Text("Add Routine")
            }
            .padding()
            .onAppear {
                vm.loadFromStorage()
                
                Text("\(numComplete)/\(vm.routines.count)")
                .padding()
            }
        }
    }
}

#Preview {
    ContentView()
}
