//
//  StatusViewController.swift
//  FacebookLogin
//
//  Created by Prem on 13/04/15.
//  Copyright (c) 2015 Murugesan, Prem Kumar. All rights reserved.
//

import UIKit

class StatusViewController: UIViewController, JBBarChartViewDelegate, JBBarChartViewDataSource {

    @IBOutlet var statusCountLabel: UILabel!
    @IBOutlet var firstStatusLabel: UILabel!
    @IBOutlet var itsBeenLabel: UILabel!
    
    
    var statusTimeArray = [NSDate]()
    var statusDictionary = [NSDate : String]()
    var statusCountDictionary = [String : Int]()
    var statusCountSortedArr = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var DFFull = NSDateFormatter()
        DFFull.dateStyle = .LongStyle
        let noOfStatus = statusTimeArray.count

        statusCountLabel.text = "Stat Count: \(noOfStatus)"
        firstStatusLabel.text = "Your first Status was on \(DFFull.stringFromDate(statusTimeArray[0]))"
        itsBeenLabel.text = "It's been \(countDaysfromLastStatus(statusTimeArray[noOfStatus - 1])) days"
        
        //Calculate the status distribution
        statusDistribution(statusTimeArray)
        
        
        //Draw the chart
        let barChartView = JBBarChartView();
        barChartView.dataSource = self;
        barChartView.delegate = self;
        barChartView.backgroundColor = UIColor.cyanColor()
        barChartView.frame = CGRectMake(0, 20, 320, 200);
        barChartView.center = CGPointMake(160, 350)
        barChartView.minimumValue = CGFloat(0)
        barChartView.reloadData();
        self.view.addSubview(barChartView);
        println("Launched");

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //Delegate methods for JBChart
    func numberOfBarsInBarChartView(barChartView: JBBarChartView!) -> UInt {
        println("numberOfBarsInBarChartView");
        return UInt(statusCountSortedArr.count)
        //        return 10 //number of lines in chart
    }
    
    func barChartView(barChartView: JBBarChartView, heightForBarViewAtIndex index: UInt) -> CGFloat {
        println("barChartView", index);
        return CGFloat(statusCountDictionary[statusCountSortedArr[Int(index)]]!)
        //        return CGFloat(arc4random_uniform(100));
    }

    
    
    
    
    
    
    //Count no of days from the given date till current date
    func countDaysfromLastStatus(lastStatusDate : NSDate) -> Int {
        
        var secondsFromLastDate = NSDate().timeIntervalSinceDate(lastStatusDate)
        let noOfDays: Int = Int(secondsFromLastDate/86400)
        
        return noOfDays
        
    }
    
    func statusDistribution(statusTimeArray : [NSDate]){
        
        statusCountDictionary.removeAll(keepCapacity: true)
        let DFDay = NSDateFormatter()
        let DFYearMonth = NSDateFormatter()
        DFDay.dateFormat = "dd"
        DFYearMonth.dateFormat = "yyyy-MM"

        for timeStamp in statusTimeArray {
            var currentDD = DFDay.stringFromDate(timeStamp).toInt()
            var currentYYYYMM = DFYearMonth.stringFromDate(timeStamp)
            
            if statusCountDictionary[currentYYYYMM] != nil{
                statusCountDictionary[currentYYYYMM] = statusCountDictionary[currentYYYYMM]! + 1
                
            } else{
             
                statusCountDictionary[currentYYYYMM] = 1
            }
        }
        
        statusCountSortedArr = sorted(statusCountDictionary.keys) {
            item1, item2 in
            
            
            let date1 = DFYearMonth.dateFromString(item1.0) as NSDate!
            let date2 = DFYearMonth.dateFromString(item2.0) as NSDate!
            return date1.compare(date2) == NSComparisonResult.OrderedAscending

        }
        
        for val in statusCountSortedArr{
            println("\(val) : \(statusCountDictionary[val]!)")
        }
        
    }
}


















//========================================================================================================

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
