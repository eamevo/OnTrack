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
    @State var id: String = ""
    @State var title: String = ""
    @State var description: String = ""
    @State var category: String = ""
    @State var frequency: Int = 0
    @State var dates: String = ""
    @State var streakLength: Int = 0
    
    @StateObject var vm = ViewModel()
    
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
                    .foregroundStyle(Color(red: 0.45, green: 0.85, blue: 0.55))
                
                TextField("Add an ID", text: $id)
                    .foregroundStyle(.black)
                    .padding([.leading, .top])
                    .frame(maxHeight: .infinity, alignment: .top)
            }
            .frame(width: 360, height: 20)
            
            Spacer()
            
            ZStack {
                Rectangle()
                    .foregroundStyle(Color(red: 0.45, green: 0.85, blue: 0.55))
                
                TextField("Add a title", text: $title)
                    .foregroundStyle(.black)
                    .padding([.leading, .top])
                    .frame(maxHeight: .infinity, alignment: .top)
            

            }
            .frame(width: 360, height: 20)
            
            Spacer()
            
            ZStack {
                Rectangle()
                    .foregroundStyle(Color(red: 0.45, green: 0.85, blue: 0.55))
                
                TextField("Add a description", text: $description)
                    .foregroundStyle(.black)
                    .padding([.leading, .top])
                    .frame(maxHeight: .infinity, alignment: .top)
            }
            .frame(width: 360, height: 70)
            
            Spacer()
            
            ZStack {
                Rectangle()
                    .foregroundStyle(Color(red: 0.45, green: 0.85, blue: 0.55))
                
                TextField("Add a category", text: $category)
                    .foregroundStyle(.black)
                    .padding([.leading, .top])
                    .frame(maxHeight: .infinity, alignment: .top)
            }
            .frame(width: 360, height: 20)
            
            Spacer()
            
            ZStack {
                Rectangle()
                    .foregroundStyle(Color(red: 0.45, green: 0.85, blue: 0.55))
                
                TextField("Add a frequency", value: $frequency, format: .number)
                    .foregroundStyle(.black)
                    .padding([.leading, .top])
                    .frame(maxHeight: .infinity, alignment: .top)
            }
            .frame(width: 360, height: 20)
            
            Spacer()
            
            ZStack {
                Rectangle()
                    .foregroundStyle(Color(red: 0.45, green: 0.85, blue: 0.55))
                
                TextField("Add dates", text: $dates)
                    .foregroundStyle(.black)
                    .padding([.leading, .top])
                    .frame(maxHeight: .infinity, alignment: .top)
            }
            .frame(width: 360, height: 20)
            
            Spacer()
            
            ZStack {
                Rectangle()
                    .foregroundStyle(Color(red: 0.45, green: 0.85, blue: 0.55))
                
                TextField("Add a streaklength", value: $streakLength, format: .number)
                    .foregroundStyle(.black)
                    .padding([.leading, .top])
                    .frame(maxHeight: .infinity, alignment: .top)
            }
            .frame(width: 360, height: 20)
            
            Spacer()
            
            
            
            Button(action: {
                vm.addRoutine(id: id, title: title, description: description, category: category, frequency: frequency, dates: dates, streakLength: streakLength)
                print(vm.routines)
            }, label: {
                ZStack {
                    Capsule(style: RoundedCornerStyle.circular)
                        .frame(width: 300, height: 85)
                        .foregroundStyle(Color(red: 0.15, green: 0.15, blue: 0.15))
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
    AddRoutineView()
}
