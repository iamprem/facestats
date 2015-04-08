//
//  EventsViewController.swift
//  FacebookLogin
//
//  Created by Prem on 07/04/15.
//  Copyright (c) 2015 Murugesan, Prem Kumar. All rights reserved.
//

import UIKit

class EventsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var eventLabel: UILabel!
    @IBOutlet var eventTableView: UITableView!
    
    var eventDetailsDict = [String : String] ()
    var eventDetailsArr = [String]()
    
    let textCellIdentifier = "TextCell"
    let swiftBlogs = ["Ray Wenderlich", "NSHipster", "iOS Developer Tips", "Jameson Quave", "Natasha The Robot", "Coding Explorer", "That Thing In Swift", "Andrew Bancroft", "iAchieved.it", "Airspeed Velocity"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventTableView.delegate = self
        eventTableView.dataSource = self
        
        if !eventDetailsDict.isEmpty{
            for (key,date) in self.eventDetailsDict{
                println("Event Name: \(key) is on \(date)")
            }
        }
        else{
            eventLabel.text = "No Events!"
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1 // Since i'm implementing with just one section keeping this as 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventDetailsArr.count
        // Most of the time my data source is an array of something...  will replace with the actual name of the data source
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(textCellIdentifier, forIndexPath: indexPath) as UITableViewCell
        
        // set cell's textLabel.text property
        // set cell's detailTextLabel.text property
        let row = indexPath.row
        cell.textLabel?.text = eventDetailsArr[row]
//        cell.detailTextLabel?.text = eventDetailsArr[row][1]
        return cell
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
