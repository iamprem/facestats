//
//  StatusViewController.swift
//  FacebookLogin
//
//  Created by Prem on 13/04/15.
//  Copyright (c) 2015 Murugesan, Prem Kumar. All rights reserved.
//

import UIKit

class StatusViewController: UIViewController {

    @IBOutlet var statusCountLabel: UILabel!
    @IBOutlet var firstStatusLabel: UILabel!
    @IBOutlet var itsBeenLabel: UILabel!
    
    
    var statusTimeArray = [NSDate]()
    var statusDictionary = [NSDate : String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var DFFull = NSDateFormatter()
        DFFull.dateStyle = .LongStyle
        let noOfStatus = statusTimeArray.count

        statusCountLabel.text = "Stat Count: \(noOfStatus)"
        firstStatusLabel.text = "Your first Status was on \(DFFull.stringFromDate(statusTimeArray[0]))"
        itsBeenLabel.text = "It's been \(countDaysfromLastStatus(statusTimeArray[noOfStatus - 1])) days"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func countDaysfromLastStatus(lastStatusDate : NSDate) -> Int {
        
        var secondsFromLastDate = NSDate().timeIntervalSinceDate(lastStatusDate)
        let noOfDays: Int = Int(secondsFromLastDate/86400)
        
        return noOfDays
        
    }
    
}

//        println("Status page =================")
//        for key in statusTimeArray{
//            var dateFormatter = NSDateFormatter()
//            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss ZZZ"
//            var dateString = dateFormatter.stringFromDate(key)
//            println(dateString)
//        }


/*

//Regular Expression to extract date and time
var timeZone = NSRegularExpression(pattern:"-(\\d{4})");
var date = NSRegularExpression(pattern: "(\\d{4}-\\d{2}-\\d{2})")
var time = NSRegularExpression(pattern: "(\\d{2}:\\d{2}:\\d{2})")
let retrivedTimeZone = timeZone.firstMatch(eventDate)
let retrivedDate = date.firstMatch(eventDate)
let retrivedTime = time.firstMatch(eventDate)
println(retrivedDate+" "+retrivedTime+" "+retrivedTimeZone)

*/


/*
//Extract Date
let dateFormatter = NSDateFormatter()
dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss ZZZ"
var extractedDate = dateFormatter.dateFromString(retrivedDate+" "+retrivedTime+" "+retrivedTimeZone)
println("Extracted Date : \(extractedDate)")
var localDate = extractedDate?.toLocalTime()
println("Local Date : \(localDate)")

*/

/*
//Get the number of seconds for the event
var timeLeftForTheEvent = NSDate().timeIntervalSinceDate(extractedDate!)
timeLeftForTheEvent *= -1
var noOfDays: Int = Int(timeLeftForTheEvent/86400)
var noOfHours:Int = Int((timeLeftForTheEvent%86400)/3600)
var noOfMinutes: Int = Int(((timeLeftForTheEvent%86400)%3600)/60)
println("\(noOfDays) days, \(noOfHours) hours and \(noOfMinutes) minutes left for the event \(eventName!)")
*/
