//
//  SelectedRoutineView.swift
//  OnTrack
//
//  Shows details of the selected routine.
//
//  Created by Noah Sadir on 4/4/24.
//
//  Contributors:
//

import SwiftUI

struct SelectedRoutineView: View {
    @EnvironmentObject var vm: ViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        let days: Int =  (vm.selectedRoutine?.frequency ?? 0) / 86400
        
        // The top view of the selected routine
        VStack {
            HStack {
                
                Button(action: {
                    // implement the Back button to go back to the ContentView.
                    dismiss()
                }, label: {
                    Image(systemName: "arrow.left")
                        .font(.system(size: 22))
                        .foregroundStyle(.blue)
                })
                .fontWeight(.bold)
                
                Spacer()
                
                Text(vm.selectedRoutine?.title ?? "No item")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .font(.system(.title, design: .default))
                Spacer()
                
                Button(action: {
                    if let selectedRoutineItem = vm.selectedRoutine {
                        vm.deleteRoutine(routine: selectedRoutineItem) // Crashes when Delete button gets clicked. selectedRoutine is not a optional. IndexOutOfBoundsError after deleting the routine.
                    }
                   
                    dismiss()
                }, label: {
                    Image(systemName: "trash")
                        .font(.system(size: 22))
                        .foregroundStyle(.red)
                })
                .fontWeight(.bold)
            }
            .frame(height: 40, alignment: .center)
            .padding()
            
            HStack {
                Spacer()
                
                Button("About") {
                    // implement a new View when About button gets clicked
                }
                .buttonStyle(.borderedProminent)
                .font(.body)
                
                Spacer()
                
//                Button("History") {
//                    // implement a new View when History button gets clicked
//                }
//                .buttonStyle(.borderedProminent)
//                .font(.body)
//                
//                Spacer()
//                
//                Button("Charts") {
//                    // implement a new View when Charts button gets clicked
//                }
//                .buttonStyle(.borderedProminent)
//                .font(.body)
//                
//                Spacer()
//                
//                Button("Records") {
//                    // implement a new View when Records button gets clicked
//                }
//                .buttonStyle(.borderedProminent)
//                .font(.body)
            }
            .font(.system(.title3, design: .monospaced))
            .fontWeight(.bold)
            .foregroundStyle(.white)
            
            // User would be able to input there own image of the routine.
//            Text("Image of the routine")
//                .frame(width: 0.9 * UIScreen.main.bounds.width, height: 0.3 * UIScreen.main.bounds.height)
//                .background(Rectangle().fill(Color.black))
//                .foregroundColor(.white)
            
            HStack {
                Text("Description")
                    .frame(alignment: .leading)
                    .fontWeight(.bold)
                    .font(.system(.headline, design: .monospaced))
                
                Spacer()
            }
            .padding(.leading)
            .padding(.trailing)
            .padding(.top)
            
            HStack {
                Text(vm.selectedRoutine?.description ?? "No item selected.")
                    .frame(alignment: .leading)
                    .font(.system(.body, design: .monospaced))
                
                Spacer()
            }
            .padding(.leading)
            .padding(.trailing)
            
            HStack {
                Text("Category:")
                    .fontWeight(.bold)
                    .font(.system(.headline, design: .monospaced))
                
                Text(vm.selectedRoutine?.category ?? "")
                    .font(.system(.body, design: .monospaced))
                
                Spacer()
            }
            .padding(.leading)
            .padding(.trailing)
            .padding(.top)
            
            HStack {
                Text("Frequency:")
                    .fontWeight(.bold)
                    .font(.system(.headline, design: .monospaced))
                
                if (days == 1) {
                    Text("Every Day")
                        .font(.system(.body, design: .monospaced))
                } else {
                    Text("Every \(days) Days")
                        .font(.system(.body, design: .monospaced))
                }
                
                Spacer()
            }
            .padding(.leading)
            .padding(.trailing)
            .padding(.top)
            
            HStack {
                Text("Current Streak:")
                    .fontWeight(.bold)
                    .font(.system(.headline, design: .monospaced))
                if let selectedRoutineItem = vm.selectedRoutine {
                    if (selectedRoutineItem.currentStreak == 0) {
                        Text("\(selectedRoutineItem.currentStreak) time(s)")
                            .font(.system(.body, design: .monospaced))
                    } else {
                        Text("\(selectedRoutineItem.currentStreak) time(s)")
                            .font(.system(.body, design: .monospaced))
                    }
                }
                
                
                Spacer()
            }
            .padding(.leading)
            .padding(.top)
            .padding(.trailing)
            
            HStack {
                if ((vm.selectedRoutine?.currentStreak ?? 0) == 0) {
                    Text("Start the day with a new habit! You got this!")
                } else {
                    Text("Keep going! You are doing great!")
                }
                
                Spacer()
            }
            .padding(.leading)
            .padding(.trailing)
            .font(.system(.body, design: .monospaced))
            .fontWeight(.bold)
            .foregroundStyle(.gray)
                
            Spacer()
        }
    }
}

#Preview {
    SelectedRoutineView()
        .environmentObject(ViewModel())
}
