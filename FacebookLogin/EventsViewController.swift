//
//  EventsViewController.swift
//  FacebookLogin
//
//  Created by Prem on 07/04/15.
//  Copyright (c) 2015 Murugesan, Prem Kumar. All rights reserved.
//

import UIKit

class EventsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {


    //MARK: UI Declaration
    @IBOutlet var eventLabel: UILabel!
    @IBOutlet var eventTableView: UITableView!
    
    //MARK: Variable Declaration
    var eventDetailsArr = [[String]]()
    let textCellIdentifier = "TextCell"
    var statusTimeArray = [NSDate]()
    var statusDictionary = [NSDate : String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventTableView.delegate = self
        eventTableView.dataSource = self
        

        if !eventDetailsArr.isEmpty{
            eventLabel.text = "Your Upcoming events!"

        }
        else{
            eventLabel.text = "No Events!"
        }
        
        println("Events page =================")
        for key in statusTimeArray{
            var dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss ZZZ"
            var dateString = dateFormatter.stringFromDate(key)
            println(dateString)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    //MARK:- DataSource protocol methods
    //MARK: Table Cell Creation

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1 // Since i'm implementing with just one section keeping this as 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return eventDetailsArr.count
        return statusTimeArray.count
        // Most of the time my data source is an array of something...  will replace with the actual name of the data source
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        
        
        var cell = tableView.dequeueReusableCellWithIdentifier(textCellIdentifier) as? UITableViewCell
        
        if cell != nil {

            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle,
                reuseIdentifier: textCellIdentifier)
        }
        // At this point, we definitely have a cell -- either dequeued or newly created,
        // so let's force unwrap the optional into a UITableViewCell
        let row = indexPath.row
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss ZZZ"
        var dateString = dateFormatter.stringFromDate(statusTimeArray[row])
        cell!.textLabel?.text = dateString
//        cell!.textLabel?.text = eventDetailsArr[row][0]
//        cell!.detailTextLabel?.text = eventDetailsArr[row][1]
        
        return cell!
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
