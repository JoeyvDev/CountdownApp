//
//  TodayViewController.swift
//  Countdown Widget
//
//  Created by Thomas Greenwood on 19/12/2015.
//  Copyright © 2015 GreenyDev. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
    @IBOutlet var countdownLabel: UILabel?
    
    func getDateAndShit(){
        // Gets the current date
        let currentDate = NSDate(timeIntervalSinceNow: 0)
        // Creates the future date
        let components = NSDateComponents()
        components.minute = 50
        components.hour = 20
        components.day = 13
        components.month = 1
        components.year = 2016
        components.timeZone = NSTimeZone(name: "ACST")
        // Creates the date based on the components given
        let futureDate = NSCalendar.currentCalendar().dateFromComponents(components)!
        // Compare the dates, get all the needed components
        let distanceComponents = NSCalendar.currentCalendar().components([.Minute, .Hour, .Day, .Month, .Year], fromDate: currentDate, toDate: futureDate, options: [])
        // Checking for plural stuff
        var finalString = ""/*
        if distanceComponents.year == 1 {
            finalString += "1 year, "
        } else {
            finalString += "\(distanceComponents.year) years, "
        }
        if distanceComponents.month == 1 {
            finalString += "1 month, "
        } else {
            finalString += "\(distanceComponents.month) months, "
        }*/
        if distanceComponents.day == 1 {
            finalString += "1 day, "
        } else {
            finalString += "\(distanceComponents.day) days, "
        }
        if distanceComponents.hour == 1 {
            finalString += "1 hour, "
        } else {
            finalString += "\(distanceComponents.hour) hours, "
        }
        if distanceComponents.minute == 1 {
            finalString += "and 1 minute remain"
        } else {
            finalString += "and \(distanceComponents.minute) minutes"
        }
        print(finalString)
        
        countdownLabel?.text = "\(finalString) to go!"
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
    }

        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.preferredContentSize = CGSizeMake(0, 30)
        
        getDateAndShit()
        
        //extensionContext?.openURL(NSURL(string: "countdown://")!, completionHandler: nil)
        
        // Do any additional setup after loading the view from its nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.

        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        getDateAndShit()

        completionHandler(NCUpdateResult.NewData)
    }
    
}
