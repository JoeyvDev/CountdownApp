//
//  ViewController.swift
//  Countdown!
//
//  Created by Thomas Greenwood on 19/12/2015.
//  Copyright © 2015 GreenyDev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var countdownDay: UILabel?
    var hasRun: Bool = false
    //var image: NSImage!
    
    func getDateAndShit(){
        // Gets the current date
        let currentDate = NSDate(timeIntervalSinceNow: 0)
        // Creates the future date
        let components = NSDateComponents()
        components.day = 14
        components.month = 1
        components.year = 2016
        components.timeZone = NSTimeZone.defaultTimeZone()
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
            finalString += "\(distanceComponents.day) days "
        }
        if distanceComponents.hour == 1 {
            finalString += "and 1 hour, "
        } else {
            finalString += "and \(distanceComponents.hour) hours"
        }/*
        if distanceComponents.minute == 1 {
            finalString += "and 1 minute remain"
        } else {
            finalString += "and \(distanceComponents.minute) minutes to go!"
        }*/
        print(finalString)
        //countdownDay?.editable = false
        countdownDay?.text = "\(finalString) to go!"
        // Swift
        countdownDay?.lineBreakMode = .ByWordWrapping // or NSLineBreakMode.ByWordWrapping
        countdownDay?.numberOfLines = 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setNeedsStatusBarAppearanceUpdate()
        
        //getDateAndShit()
        
        self.view.backgroundColor = UIColor.blackColor()
        
        //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadDate) name:@"ReloadAppDelegateTable" object:nil];
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "reloadDate", name: "ReloadAppDelegateDate", object: nil)
        // Do any additional setup after loading the view.
    }
    func reloadDate(){
        self.getDateAndShit()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }


}

