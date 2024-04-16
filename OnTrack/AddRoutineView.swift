//
//  AddRoutineView.swift
//  OnTrack
//
//  Allows user to add a new routine to their list of routines.
//
//  Created by Noah Sadir on 4/4/24.
//
//  Contributors: David
//

import SwiftUI

struct AddRoutineView: View {
    let choices = [
        "Daily",
        "Weekly",
        "Monthly",
    ]
    @State var title: String = ""
    @State var description: String = ""
    @State var category: String = ""
    @State var frequency: String?
    
    @EnvironmentObject var vm: ViewModel
    
    var body: some View {
        VStack {
            HStack {
                Text("OnTrack")
                    .font(.largeTitle)
                    .bold()
                    .padding(.leading)
                Spacer()
            }
            
            Text("Add Routine")
                .padding(.vertical)
                .font(.largeTitle)
               .italic()
        
            ZStack {
                Rectangle()
                    .foregroundStyle(.cyan)
                
                TextField("Add a title", text: $title)
                    .foregroundStyle(.white)
                    .padding([.leading, .top])
                    .frame(maxHeight: .infinity, alignment: .top)
            }
            .frame(width: 360, height: 70)
            
            Spacer()
            
            ZStack {
                Rectangle()
                    .foregroundStyle(.cyan)
                
                TextField("Add a description", text: $description)
                    .foregroundStyle(.white)
                    .padding([.leading, .top])
                    .frame(maxHeight: .infinity, alignment: .top)
            }
            .frame(width: 360, height: 200)
            
            Spacer()
            
            ZStack {
                Rectangle()
                    .foregroundStyle(.cyan)
                
                TextField("Add a category", text: $category)
                    .foregroundStyle(.white)
                    .padding([.leading, .top])
                    .frame(maxHeight: .infinity, alignment: .top)
            }
            .frame(width: 360, height: 70)
            
            Spacer()
            
            NavigationStack {
                List(choices, id: \.self, selection: $frequency) { choice in
                    Text(choice)
                }
            }
            .frame(width: 360, height: 180)
            
            Spacer()

            
            Button(action: {
                vm.addRoutine(title: title, description: description, category: category, frequency: frequency!)
                print(vm.routines)
            }, label: {
                ZStack {
                    Capsule(style: RoundedCornerStyle.circular)
                        .frame(width: 200, height: 60)
                        .foregroundStyle(.black)
                        .padding(.top)
                    Text("Submit")
                        .padding(.top)
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                }
            })
            
            
           
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .padding(.top)
        
    }
}

#Preview {
    AddRoutineView().environmentObject(ViewModel())
}


