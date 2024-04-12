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
    @Published var routines: [Routine] = [Routine(id: "1", title: "Hello", description: "This is a test", category: "Activity", frequency: 86400, successfulDays: [], currentStreak: 0)]
    
    @Published var selectedRoutine: Int = 0
    
    // User's name from onboarding
    @Published var name: String = ""
    
    @Published var isOnboarded: Bool = false
    
    // should increment for generating unique ID's
    var idCounter: Int = 0
    
    // List of daily quotes
    // TODO: Find 31 quotes and add them to this array
    //       (also remove the "Quote 1" that I added as a placeholder)
    var dailyQuotes: [String] = [
        "Quote 1",
    ]
    
    /**
     * Set the user's name.
     */
    func setName(name: String) {
        // TODO: set the name variable in the view model to the provided name
        let trimmedName = name.trimmingCharacters(in: .whitespacesAndNewlines)
        if trimmedName.isEmpty {
            print("Error: Name cannot be empty.")
            return
        }
        
        let alphanumericPattern = "^[a-zA-Z0-9]*$"
            if let regex = try? NSRegularExpression(pattern: alphanumericPattern) {
                if regex.firstMatch(in: trimmedName, options: [], range: NSRange(location: 0, length: trimmedName.utf16.count)) == nil {
                    print("Error: Name must contain only alphanumeric characters.")
                    return
                }
            }
        
        self.name = trimmedName
    }
    
    /**
     * Get the quote of the day. Return a single string.
     */
    func getDailyQuote() -> String {
        // TODO: Index the quote array by the current day of the month
        //       and return the quote string
        
        return ""
    }
    
    /**
     * Add a new routine to the list of routines.
     */
    func addRoutine(routine: Routine) {
        // TODO: Append routines list with this new routine
    }
    
    /**
     * Search for a routine in the list based on its ID and delete it.
     *
     * Return whether or not it was successful.
     */
    func deleteRoutine(routine: Routine) -> Bool {
        // TODO: Find the index of the provided routine
        //       and delete it from the array
        //       (hint: see the function at the bottom)
        
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
        // TODO: Append the current date to the routine.
        //       Then, register the changes with the routines list
        //       using the provided `editRoutine` function
        
        return false
    }
    
    func routineIsComplete(routine: Routine) -> Bool {
        // TODO: Get the current date and subtract by the frequency
        //       Then, get the last item from routine.
        //       If the last item is before the subtracted date, return false
        //       otherwise, return true.
        //
        // **HINT** Use the `timeIntervalSince1970` property of Date
        //          https://stackoverflow.com/questions/25096602/get-unix-epoch-time-in-swift
        
        return false
    }
    
    /**
     * (For a later time) Save the data to storage so that it remains when
     * the user closes the app.
     *
     * Hint: Lookup UserDefaults in Swift
     */
    private func saveToStorage() {
        // TODO: Store routines, name, isOnboarded, and idCounter to storage
        //       with UserDefaults
    }
    
    /**
     * (For a later time) Load existing user data from storage. If there isn't
     * any, don't do anything.
     *
     * Hint: Lookup UserDefaults in Swift
     */
    private func loadFromStorage() {
        // TODO: Fetch routines, name, isOnboarded, and idCounter from stroage
        //       with UserDefaults
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
        if let index = getRoutineIndex(routine: routine) {
            routines[index] = routine
            return true
        }
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
        for i in 0..<routines.count {
            if routines[i].id == routine.id {
                return i
            }
        }
        return nil
    }
    
    func generateUniqueId() -> String {
        idCounter += 1
        return idCounter.description
    }
}
