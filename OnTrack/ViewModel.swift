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
        "\"Just one small positive thought in the morning can change your whole day.\" — Dalai Lama",
        "\"Habits change into character.\" — Ovid",
        "\"If you want to change your world, you need to start cultivating good habits.\" — Mina Tadros",
        "\"We are what we repeatedly do. Excellence, then, is not an act, but a habit.\" — Aristotle",
        "\"Habits are never-ending goals, if you think about it. They have no deadline and no endpoint. They are casual daily activities like brushing your teeth or combing your hair.\" — Zoe McKey",
        "\"Life is habit. Or rather life is a succession of habits.\" — Samuel Beckett",
        "\"Success is the sum of small efforts repeated day in and day out.\" — Robert Collier",
        "\"Successful people are simply those with successful habits.\" — Brian Tracy",
        "\"You’ll never change your life until you change something you do daily. The secret of your success is found in your daily routine.\" — John C. Maxwell",
        "\"Your positive action combined with positive thinking results in success.\" - Shiv Khera",
        "\"Every day of our lives, we are on the verge of making those slight changes that would make all the big difference.\" — Mignon McLaughlin",
        "\"A daily routine built on good habits and disciplines separates the most successful among us from everyone else.\" — Darren Hardy",
        "\"Success has a simple formula: do your best, and people may like it.\" — Sam Ewing",
        "\"Always do your best. What you plant now, you will harvest later.\" — Og Mandino",
        "\"If you don’t like the road you’re walking, start paving another one.\" — Dolly Parton",
        "\"Dreaming, after all, is a form of planning.\" — Gloria Steinem",
        "\"Before anything else, preparation is the key to success.\" — Alexander Graham Bell",
        "\"If you are going to achieve excellence in big things, you develop the habit in little matters. Excellence is not an exception, it is a prevailing attitude.\" — Colin Powell",
        "\"Excellence is not a singular act, but a habit. You are what you repeatedly do.\" — Shaquille O’Neal",
        "\"Winners make a habit of doing things losers don’t want to do.\" — Lucas Remmerswaal",
        "\"We become what we repeatedly do.\" ― Sean Covey",
        "\"Habits are the invisible architecture of everyday life.\" - James Clear",
        "\"A nail is driven out by another nail; habit is overcome by habit.\" — Erasmus",
        "\"Powerful indeed is the empire of habit.\" — Publicus Syrus",
        "\"Motivation is what gets you started. Habit is what keeps you going.\" — Jim Ryuh",
        "\"What you do every day matters more than what you do once in a while.\" — Gretchen Rubin",
        "\"Let go of your old tired habits and plant new habits in fertile soil.\" — Harley King",
        "\"The secret of your future is hidden in your daily routine.\" — Mike Murdock",
        "\"Quality is not an act, it is a habit.\" — Aristotle",
        "\"Habits are like a cable. We weave a strand of it every day and soon it cannot be broken.\" — Horace Mann",
        "\"Good habits are the key to all success.\" — Og Mandino"
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
        let calendar = Calendar.current
        let dayOfMonth = calendar.component(.day, from: Date())
        let quoteIndex = dayOfMonth - 1
        
        
        //       and return the quote string
        return dailyQuotes[quoteIndex]
    }
    
    /**
     * Add a new routine to the list of routines.
     */
    func addRoutine(routine: Routine) {
        routines.append(routine)
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
        var newRoutine = routine
        let date = Date()
        if let last = routine.successfulDays.last as Date? {
            if Calendar.current.isDateInToday(last) {
                return false
            }
        }
        newRoutine.successfulDays.append(date)
        let days: Int = routine.successfulDays.last.map { lastDate in Calendar.current.dateComponents([.day], from: lastDate).day ?? 0} ?? 0
        if days <= 1 {
            newRoutine.currentStreak += 1
        } else {
            newRoutine.currentStreak = 1
        }
        return editRoutine(routine: newRoutine)
    }
    
    func routineIsComplete(routine: Routine) -> Bool {
        let date = Date()
        let newDate = date.addingTimeInterval(-Double(routine.frequency))
        if let lastDate = routine.successfulDays.last as Date? {
            return lastDate >= newDate
        } else {
            return false
        }
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
