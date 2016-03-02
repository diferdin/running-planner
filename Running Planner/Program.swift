//
//  ProgramEntry.swift
//  Running Planner
//
//  Created by Antonio on 14/02/2016.
//  Copyright © 2016 diferdin. All rights reserved.
//

import Foundation

struct ProgramEntry {
    var weekNumber: Int
    var runNumber: Int
    var runLength: Double
    var runType: String
}

class Program {
    var programEntries = [Int:ProgramEntry]()
    
    var description: String {
        get {
            return programEntries.description
        }
    }
    
    
    func addToProgram(atIndex: Int, runLength: Double, runNumber: Int, weekNumber: Int, type: String) {
        programEntries[atIndex] = ProgramEntry(weekNumber: weekNumber, runNumber: runNumber, runLength: runLength, runType: type)
    }
    
    func getEntry(atIndex: Int) -> ProgramEntry {
        return programEntries[atIndex]!
    }
    
    func getProgram() -> Program {
        return self
    }
    
    func updateProgram(atIndex: Int, runLength: Double, runNumber: Int, weekNumber: Int, type: String) {
        let programEntry = ProgramEntry(weekNumber: weekNumber, runNumber: runNumber, runLength: runLength, runType: type)
        programEntries.updateValue(programEntry, forKey: atIndex)
    }
    
    func getLength() -> Int {
        return programEntries.count
    }
}
