//
//  PlannerViewController.swift
//  Running Planner
//
//  Created by Antonio on 09/02/2016.
//  Copyright (c) 2016 diferdin. All rights reserved.
//

import UIKit

class PlannerViewController: UIViewController {

    
    @IBOutlet weak var initialMileageLabel: UILabel!
    @IBOutlet weak var initialMileageSlider: UISlider!
    @IBOutlet weak var weeklyIncreaseLabel: UILabel!
//    @IBOutlet weak var weeklyIncreaseLimitLabel: UILabel!
    @IBOutlet weak var weeklyIncreaseSlider: UISlider!
    @IBOutlet weak var targetMileageLabel: UILabel!
    @IBOutlet weak var targetMileageStartLimitLabel: UILabel!
    @IBOutlet weak var targetMileageSlider: UISlider!
    @IBOutlet weak var weeklyRunsSegmentedControl: UISegmentedControl!
    
    var data = [String:Double]()
    
    override func viewDidLoad() {
        data["initialMileage"] = Double(initialMileageSlider.value)
        
        initialMileageLabel.text = String(format:"Initial Mileage: %.1f Km", initialMileageSlider.value)
        targetMileageStartLimitLabel.text = String(format: "%.1f", data["initialMileage"]!)
        targetMileageSlider.minimumValue = Float(data["initialMileage"]!)
        targetMileageSlider.value = Float(data["initialMileage"]!)*3
        targetMileageLabel.text = String(format: "Target Mileage %.1f Km", targetMileageSlider.value)
        
        data["weeklyIncrease"] = Double(weeklyIncreaseSlider.value)
        data["targetMileage"] = Double(targetMileageSlider.value)
        data["weeklyRuns"] = Double(weeklyRunsSegmentedControl.selectedSegmentIndex+1)
    }
    
    @IBAction func initialMileageSliderValueChanged(sender: UISlider) {
        data.updateValue(Double(sender.value), forKey: "initialMileage")
        initialMileageLabel.text = String(format: "Initial Mileage: %.1f Km",sender.value)
        targetMileageStartLimitLabel.text = String(format: "%.1f", sender.value)
        targetMileageSlider.minimumValue = sender.value
        data.updateValue(Double(sender.value), forKey: "targetMileage")
        targetMileageLabel.text = String(format: "Target Mileage %.1f Km", sender.value)
    }
    
    @IBAction func weeklyIncreaseSliderValueChanged(sender: UISlider) {
        data.updateValue(Double(sender.value), forKey: "weeklyIncrease")
        weeklyIncreaseLabel.text = String(format: "Weekly Increase: %.0f%%", sender.value)
    }
    
    @IBAction func targetMileageSliderValueChanged(sender: UISlider) {
        data.updateValue(Double(sender.value), forKey: "targetMileage")
        targetMileageLabel.text = String(format: "Target Mileage %.1f Km", sender.value)
    }
    
    @IBAction func weeklyRinsSegmentedControlValueCHanged(sender: UISegmentedControl) {
        data.updateValue(Double(sender.selectedSegmentIndex+1), forKey: "weeklyRuns")
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "toPlanResultsSegue") {
            let destinationVC = segue.destinationViewController as! PlannerResultsViewController
            destinationVC.userData = data
        }
    }
}