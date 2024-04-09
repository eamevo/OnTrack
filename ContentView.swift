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
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
