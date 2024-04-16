//
//  AddRoutineView.swift
//  OnTrack
//
//  Allows user to add a new routine to their list of routines.
//
//  Created by Noah Sadir on 4/4/24.
//
//  Contributors:
//

import SwiftUI

struct AddRoutineView: View {
    @EnvironmentObject var vm: ViewModel
    var title = ""
    var description = ""
    var frequency = 0
    let frequencies = ["Daily", "Weekly", "Monthly"]

    var body: some View {
            Form {
                Section(header: Text("Title")) {
                    TextField("Enter title", text: $title)
                }

                Section(header: Text("Description")) {
                    TextField("Enter description", text: $description)
                }

                //Text(frequencies[index])
                //Unsure how to make a dropdown thing

                Section {
                    Button("Add Routine") {
                        let id = vm.generateUniqueId()
                        let frequencyInSeconds = getFrequency(frequency)
                        let newRoutine = Routine(id: id, title: title, description: description, frequency: frequencyInSeconds, successfulDays: [], currentStreak: 0)
                        vm.addRoutine(routine: newRoutine)
                    }
                }
            }
        }
    }

    func getFrequency(_ frequency: Int) -> Int {
        switch frequency {
        case 0:
            return 0
        case 1:
            return 1
        case 2:
            return 2
        default:
            return 0
        }
    }
}


#Preview {
    AddRoutineView()
}
