//
//  AddToCalendarViewController.swift
//  Running Planner
//
//  Created by Antonio on 05/03/2016.
//  Copyright © 2016 diferdin. All rights reserved.
//

import UIKit
import EventKit

class AddToCalendarViewController: UIViewController {
    
    @IBOutlet weak var startProgramPicker: UIDatePicker!
    @IBOutlet var runDays: [UIButton]!
    @IBOutlet weak var eventsButton: UIButton!

    
    var userData = [String:Double]()
    var weeklyRuns:Int = 0
    var selectedRunDays = [String]()
    
    let eventsData = [EKEvent]()

    override func viewDidLoad() {
        super.viewDidLoad()

        weeklyRuns = Int(userData["weeklyRuns"]!)
    }
    
    @IBAction func buttonPushed(sender: UIButton) {
        
        if(selectedRunDays.count < weeklyRuns) {
            
            //sender.titleLabel?.textColor = UIColor(red: 255, green: 168, blue: 0, alpha: 1)
            sender.titleLabel?.textColor = UIColor.redColor()
            
            selectedRunDays.append((sender.titleLabel?.text!)!)
            sender.selected = true
            if(selectedRunDays.count == weeklyRuns) {
                eventsButton.hidden = false
            }
        } else {
            if(sender.selected) {
                selectedRunDays = selectedRunDays.filter() {$0 != sender.titleLabel?.text}
                sender.selected = false
                eventsButton.hidden = true
            }
        }        
    }
}
