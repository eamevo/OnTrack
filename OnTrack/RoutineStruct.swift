//
//  RoutineStruct.swift
//  OnTrack
//
//  Created by Enam Amevo on 4/4/24.
//

import Foundation
struct routineStruct: CustomStringConvertible{
    let name:String
    let routineDescription:String
    var tasks: [Task]
    
    var description: String{
        "Routine: \(name), Description: \(routineDescription), Tasks: \(tasks)"
    }
}

struct Task{
    let name:String
    var completed:Bool
  //figuring out a way to use completed bool
        
    var description: String{"Task: \(name), Completed? \(completed) "}
    }
}


var routines:[routineStruct]=[]

let routine1 = routineStruct(name: "Test Routine", routineDescription: "Testing 123", tasks: [Task(name: "make bed",completed: false),Task(name: "feed pet",completed: false),Task(name:"affirmations",completed:false)])
