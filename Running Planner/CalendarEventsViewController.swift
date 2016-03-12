//
//  CalendarEventsViewController.swift
//  Running Planner
//
//  Created by Antonio on 05/03/2016.
//  Copyright © 2016 diferdin. All rights reserved.
//

import UIKit
import EventKit

class CalendarEventsViewController: UITableViewController {
    
    let eventStore = EKEventStore()
    var calendars: [EKCalendar]?
    
    override func viewWillAppear(animated: Bool) {
        checkCalendarAuthorisationStatus()
    }
    
    func requestAccessToCalendar() {
        eventStore.requestAccessToEntityType(EKEntityType.Event, completion: {
            (accessGranted: Bool, error: NSError?) in
            
            if accessGranted == true {
                dispatch_async(dispatch_get_main_queue(), {
                    self.loadCalendars()
                    self.refreshTableView()
                })
            } else {
                dispatch_async(dispatch_get_main_queue(), {
                    //self.needPermissionView.fadeIn()
                })
            }
        })
    }
    
    func loadCalendars() {
        self.calendars = eventStore.calendarsForEntityType(EKEntityType.Event)
    }
    
    func refreshTableView() {
        //calendarsTableView.hidden = false
        //calendarsTableView.reloadData()
    }
    
    func checkCalendarAuthorisationStatus() {
        
        let status = EKEventStore.authorizationStatusForEntityType(EKEntityType.Event)
        
        switch (status) {
        case EKAuthorizationStatus.NotDetermined:
            requestAccessToCalendar()
        
        case EKAuthorizationStatus.Authorized:
            loadCalendars()
            refreshTableView()
        
        //case EKAuthorizationStatus.Restricted, EKAuthorizationStatus.Denied:
            //needPermissionView.fadeIn()
        default:
             break
        }
    }
}




