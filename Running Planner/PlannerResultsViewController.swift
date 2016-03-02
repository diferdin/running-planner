//
//  PlannerResultsViewController.swift
//  Running Planner
//
//  Created by Antonio on 11/02/2016.
//  Copyright © 2016 diferdin. All rights reserved.
//

import UIKit

class PlannerResultsViewController: UITableViewController {

    struct ProgramEntry {
        var week = 0
        var run = 0
        var length = 0.0
        var type = "none"
    }
    
    
    var userData = [String:Double]()
    var programData = Program()
    
    var initialMileage:Double = 0.0
    var weeklyIncrease:Double = 0.0
    var targetMileage:Double = 0.0
    var weeklyRuns:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        initialMileage = userData["initialMileage"]!
        weeklyIncrease = userData["weeklyIncrease"]!
        targetMileage = userData["targetMileage"]!
        weeklyRuns = Int(userData["weeklyRuns"]!)
        
        calculateProgramParameters()
    }
    
    func calculateProgramParameters() {
        var runIndex = 0;
        var index = 0;
        var weekIndex = 0;
        var intermediateMileage = initialMileage
        
        while (targetMileage > intermediateMileage) {
            if( weekIndex == 0 || runIndex > weeklyRuns) {
                weekIndex++
                runIndex = 1
                
                let addedMileage = (intermediateMileage * weeklyIncrease)/100.0
                intermediateMileage += addedMileage
            }
            
            programData.addToProgram(index, runLength: intermediateMileage, runNumber: runIndex, weekNumber: weekIndex, type: "na")
            
            runIndex++
            index++
        }
        
        print("inserted \(index) entries in program")
    }
    
    
    //MARK: Table data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return programData.getLength()
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ProgramTableViewCell", forIndexPath: indexPath) as! ProgramTableViewCell
        
        let entry = programData.getEntry(indexPath.row)
        cell.runWeekLabel.text = String(format: "%d", entry.weekNumber)
        cell.runLabel.text = String(format:"%d", entry.runNumber)
        cell.runLengthLabel.text = String(format: "%.2f", entry.runLength)
        cell.runTypeLabel.text = entry.runType
        
        return cell
    }
}