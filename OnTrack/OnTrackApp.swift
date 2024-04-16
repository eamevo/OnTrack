//
//  OnTrackApp.swift
//  OnTrack
//
//  Created by Enam Amevo on 3/28/24.
//

import SwiftUI

@main
struct OnTrackApp: App {
    @ObservedObject var vm: ViewModel = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(vm)
        }
    }
}
