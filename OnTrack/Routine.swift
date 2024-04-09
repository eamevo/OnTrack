//
//  Routine.swift
//  OnTrack
//
//  Model class for routines.
//
//  Created by Noah Sadir on 4/4/24.
//
//  Contributors:
//

import Foundation

struct Routine: Identifiable {
    var id: String
    // - Title
    let title: String
    // - Description
    let description: String
    // - Category (can be string for simplicity)
    var category: String
    // - Frequency (typically measured in seconds, e.g. 86400 = 1 day)
    var frequency: Int
    // - List of dates that routine was followed
    var successfulDays: [String]
    // - Current streak length
    var currentStreak: Int
}
