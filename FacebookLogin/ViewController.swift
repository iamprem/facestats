//
//  ViewController.swift
//  FacebookLogin
//
//  Created by Murugesan, Prem Kumar on 4/3/15.
//  Copyright (c) 2015 Murugesan, Prem Kumar. All rights reserved.
//

import UIKit
import Alamofire
import Foundation
//import SwiftyJSON --> No need to import this file



class ViewController: UIViewController, FBLoginViewDelegate {

    //MARK: - UI Declaration
    @IBOutlet var fbLoginView : FBLoginView!
    @IBOutlet var profilePictureView : FBProfilePictureView!
    @IBOutlet var firstNameLabel: UILabel!
    @IBAction func eventsButton(sender: AnyObject) {
        if(FBSession.activeSession().isOpen){
            self.performSegueWithIdentifier("homeToEventSegue", sender: self)
        }
        else{
            firstNameLabel.text = "Please Login!"
            firstNameLabel.hidden = false
        }
        
    }
    
    //MARK: - Variable Declaration
    var firstName : String!
    var lastName : String!
    var email : String!

    var eventDetailsArr = [[String]]()
    var statusTempArr = [[String]]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fbLoginView.delegate = self
        self.fbLoginView.readPermissions = ["public_profile", "email", "user_friends", "user_events"]
        
    }

    //Mark: After Login
    func loginViewShowingLoggedInUser(loginView : FBLoginView!) {
        println("User Logged In")
        println("This is where you perform a segue.")
        
        
        
        //Get the access token of the current session
        
        var accessToken = FBSession.activeSession().accessTokenData.accessToken

        //println(accessToken)
        
        
        
        //MARK: requestForEvents
        
        Alamofire.request(Alamofire.Method.GET, "https://graph.facebook.com/v2.3/me/events?access_token="+accessToken+"&debug=all&format=json&method=get&pretty=0&suppress_http_code=1").responseJSON() {
            (_, _, jsonData, _) in
            
            // TODO: Unwrap the optional instead of forced unwrapping! -> Prem
            let data = JSON(jsonData!)
            //println(data)
            
            /******************************************************/
            self.eventDetailsArr.removeAll(keepCapacity: true)
            //println(data.count)

            for var i = 0; i < data.count; ++i {
                
                // get news title from json object
                if let eventName = data["data"][i]["name"].string {
                    if let dateStringtemp = data["data"][i]["start_time"].string {
                        
                        var eventDate = self.dateStringToDateObject(dateStringtemp)

                        var dateFormatter = NSDateFormatter()
                        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss ZZZ"
                        var dateString = dateFormatter.stringFromDate(eventDate)
                        var dateStringLength = countElements(dateString)
                        var subStringIndex = dateStringLength - 6
                        var tinyDateString = dateString.substringToIndex(advance(dateString.startIndex, subStringIndex))
                        

                        // add to Array
                        self.eventDetailsArr.append([eventName, tinyDateString])
                        

                    }
                    
                }
                
            }
            /******************************************************/
            
            
            //MARK: requestForStatuses
            
            Alamofire.request(Alamofire.Method.GET, "https://graph.facebook.com/v2.3/me/statuses?access_token="+accessToken+"&debug=all&format=json&method=get&pretty=0&suppress_http_code=1").responseJSON() {
                (_, _, jsonData, _) in
                
                // TODO: Unwrap the optional instead of forced unwrapping! -> Prem
                let data = JSON(jsonData!)
                println(data)
                var updatedTime1: String?
                
                for var i = 0; i < data["data"].count; ++i {
                    updatedTime1 = data["data"][i]["message"].string
                    if updatedTime1 != nil {
                        
                        var updatedTime = data["data"][i]["updated_time"].string!
                        var message = data["data"][i]["message"].string!
                        self.statusTempArr.append([updatedTime, message])
                        
                        //println("Time: \(updatedTime) Message: \(message)")
                    }
                }
                
                
                var nextPageLink = data["paging"]["next"].string
                var i = 1
                println("Next Link : \(nextPageLink!)")
                if nextPageLink != nil && i < 3 {
                    println("I'm here!")
                    Alamofire.request(Alamofire.Method.GET, nextPageLink!).responseJSON() {
                        (_, _, jsonData, _) in
                        
                        // TODO: Unwrap the optional instead of forced unwrapping! -> Prem
                        let data1 = JSON(jsonData!)
                        println(data1)
                        println("i Value \(i)")
                        nextPageLink = data1["paging"]["next"].string
                        i += 1
                    }
                    println(i)
                    var j = i
                    println(j)
//                    while j == i{
//                        
//                    }
                }
                    
                
                
                //Print the Status array
                /*
                println(self.statusTempArr.count)
                println(self.statusTempArr[0].endIndex)
                for rows in 0..<self.statusTempArr.count{
                    for columns in 0..<self.statusTempArr[0].endIndex{
                        println(self.statusTempArr[rows][columns])
                    }
                }
                */
                
            }

            
            
            
            

            //TODO: Take the regular expression and make a function

            if var eventDate : String = data["data"][0]["start_time"].string{
                

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
            }
            
        }
        
    }
    
    
    //MARK: Fetched Data after Login
    func loginViewFetchedUserInfo(loginView : FBLoginView!, user: FBGraphUser){
        
        self.firstName = user.first_name
        self.lastName = user.last_name
        profilePictureView.profileID = user.objectID
        
        
        self.firstNameLabel.text = "Hey \(user.first_name)!"
        self.firstNameLabel.hidden = false
        

        //To get the email id - Use the following method coz, there is no available property for the
        // user - FBGraphUser object to get email id
        
        FBRequestConnection.startForMeWithCompletionHandler { (connection, user, error) -> Void in
            if (error == nil){
                self.email = user.objectForKey("email") as String
                //self.performSegueWithIdentifier("showBasicInfoView", sender: self)
            }
        }

    }
    
    
    //Mark: After user Logout
    func loginViewShowingLoggedOutUser(loginView : FBLoginView!) {
        
        profilePictureView.profileID = nil
        self.firstNameLabel.hidden = true
        self.firstNameLabel.text = ""
//        self.performSegueWithIdentifier("eventsToHomeSegue", sender: EventsViewController())
        println("User Logged Out")
    }
    
    func loginView(loginView : FBLoginView!, handleError:NSError) {
        println("Error: \(handleError.localizedDescription)")
    }
    
    
    
    //Overridden Methods
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    //Mark: Segue Data preparation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "showBasicInfoView"){
            var vc: BasicInfoViewController = segue.destinationViewController as BasicInfoViewController
            vc.firstName = self.firstName
            vc.lastName = self.lastName
            vc.email = self.email
        }
        
        if segue.identifier == "homeToEventSegue" {
            if let destinationVC = segue.destinationViewController as? EventsViewController{

                destinationVC.eventDetailsArr = self.eventDetailsArr
                destinationVC.eventDetailsArr = self.statusTempArr
                

            }
        }
        
    }
    
    
    
    /*
    Convert the string format date to UTC Date and return the date object
    */
    func dateStringToDateObject(inputDateStr: String) -> NSDate {
        
        var eventDate = inputDateStr.stringByReplacingOccurrencesOfString("T", withString: " ", options: NSStringCompareOptions.LiteralSearch, range: nil)
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ssZZZ"
        var extractedDateUTC = dateFormatter.dateFromString(eventDate)
        
        return extractedDateUTC!
        
    }


}


//An Extenstion of NSDate class to convert Local --> UTC/GMT and UTC/GMT --> Local

extension NSDate {
    // Convert UTC (or GMT) to local time
    func toLocalTime() -> NSDate {
        let timezone: NSTimeZone = NSTimeZone.localTimeZone()
        let seconds: NSTimeInterval = NSTimeInterval(timezone.secondsFromGMTForDate(self))
        return NSDate(timeInterval: seconds, sinceDate: self)
    }
    
    // Convert local time to UTC (or GMT)
    func toGlobalTime() -> NSDate {
        let timezone: NSTimeZone = NSTimeZone.localTimeZone()
        let seconds: NSTimeInterval = -NSTimeInterval(timezone.secondsFromGMTForDate(self))
        return NSDate(timeInterval: seconds, sinceDate: self)
    }
}
