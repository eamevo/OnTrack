//
//  ViewModel.swift
//  OnTrack
//
//  Main controller for application logic.
//
//  Created by Noah Sadir on 4/4/24.
//
//  Contributors:
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    // Published because we want the UI to respond to changes in routines
    @Published var routines: [Routine] = []
    
    // User's name from onboarding
    @Published var name: String = ""
    
    @Published var isOnboarded: Bool = false
    
    // should increment for generating unique ID's
    var idCounter: Int = 0
    
    // List of daily quotes
    var dailyQuotes: [String] = []
    
    /**
     * Set the user's name.
     */
    func setName(name: String) {
        
    }
    
    /**
     * Get the quote of the day. Return a single string.
     */
    func getDailyQuote() -> String {
        return ""
    }
    
    /**
     * Add a new routine to the list of routines.
     */
    func addRoutine(routine: Routine) {
        
    }
    
    /**
     * Replace an existing routine with new data.
     *
     * You can use the "id" field of the new routine to figure out which one
     * it should replace.
     *
     * Return whether or not it was successful.
     */
    func editRoutine(routine: Routine) -> Bool {
        return false
    }
    
    /**
     * Search for a routine in the list based on its ID and delete it.
     *
     * Return whether or not it was successful.
     */
    func deleteRoutine(routine: Routine) -> Bool {
        return false
    }
    
    /**
     * Mark a routine as complete for the current time.
     *
     * The routine should be edited such the routine date list and streak
     * counter are updated appropriately.
     *
     * Return whether or not it was successful.
     */
    func markRoutine(routine: Routine) -> Bool {
        return false
    }
    
    /**
     * (USE THIS FOR THE ABOVE FUNCTIONS)
     *
     * Find the index of `routines` where this routine is located.
     *
     * Return nil if it cannot be found.
     */
    func getRoutineIndex(routine: Routine) -> Int? {
        return nil
    }
    
    /**
     * (For a later time) Save the data to storage so that it remains when
     * the user closes the app.
     *
     * Hint: Lookup UserDefaults in Swift
     */
    private func saveToStorage() {
        
    }
    
    /**
     * (For a later time) Load existing user data from storage. If there isn't
     * any, don't do anything.
     *
     * Hint: Lookup UserDefaults in Swift
     */
    private func loadFromStorage() {
        
    }
}
