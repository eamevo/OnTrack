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
    @Environment(\.dismiss) var dismiss
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
                
                Text("Add Routine")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .font(.system(.title, design: .default))
                Spacer()
                
                Button(action: {
                    
                }, label: {
                    Image(systemName: "trash")
                        .font(.system(size: 22))
                        .foregroundStyle(.red)
                })
                .hidden()
                .fontWeight(.bold)
            }
            .frame(alignment: .center)
            .padding()
        
            ZStack {
                Rectangle()
                    .foregroundStyle(.cyan)
                
                TextField("Add a title", text: $title)
                    .foregroundStyle(.white)
                    .padding([.leading, .top])
                    .frame(maxHeight: .infinity, alignment: .top)
            }
            .frame(height: 60)
            .border(.black, width: 5)
            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
            
            ZStack {
                Rectangle()
                    .foregroundStyle(.cyan)
                
                TextField("Add a description", text: $description)
                    .foregroundStyle(.white)
                    .padding([.leading, .top])
                    .frame(maxHeight: .infinity, alignment: .top)
            }
            .border(.black, width: 5)
            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
            
            ZStack {
                Rectangle()
                    .foregroundStyle(.cyan)
                
                TextField("Add a category", text: $category)
                    .foregroundStyle(.white)
                    .padding([.leading, .top])
                    .frame(maxHeight: .infinity, alignment: .top)
            }
            .frame(height: 60)
            .border(.black, width: 5)
            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
            
            List(choices, id: \.self, selection: $frequency) { choice in
                Text(choice)
            }
            .scrollContentBackground(.hidden)
            .background(.cyan)
            .frame(height: 180)
            .border(.black, width: 5)
            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
            
            Spacer()

            
            Button(action: {
                vm.addRoutine(title: title, description: description, category: category, frequency: frequency!)
                print(vm.routines)
                dismiss()
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


