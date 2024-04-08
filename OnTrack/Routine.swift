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
    // TODO: Add data fields
    // - Title
    let Title:String
    // - Description
    let routineDescription:String
    // - Category (can be string for simplicity)
    var category:String
    // - Frequency (typically measured in seconds, e.g. 86400 = 1 day)
    var Frequency:Int
    // - List of dates that routine was followed
    var successfulDays:[String]
    // - Current streak length
    var currentStreak: Int
}

//struct routineStruct: CustomStringConvertible{
//    let name:String
//    let routineDescription:String
//    var tasks: [Task]
//    
//    var description: String{
//        "Routine: \(name), Description: \(routineDescription), Tasks: \(tasks)"
//    }
//}

//struct Task: CustomStringConvertible{
//    let name:String
//    var completed:Bool
//    mutating func updateyesOrNo(){
//        if completed == true{
//            Bool = "Yes"}
//        else if completed == false{
//            yesOrNo = "No"
//        }
