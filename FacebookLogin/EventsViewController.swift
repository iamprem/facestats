//
//  EventsViewController.swift
//  FacebookLogin
//
//  Created by Prem on 07/04/15.
//  Copyright (c) 2015 Murugesan, Prem Kumar. All rights reserved.
//

import UIKit

class EventsViewController: UIViewController {

    @IBOutlet var eventLabel: UILabel!
    
    var eventDetailsDict = [String : String] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if !eventDetailsDict.isEmpty{
            for (key,date) in self.eventDetailsDict{
                println("Event Name: \(key) is on \(date)")
            }
        }
        else{
            eventLabel.text = "No Events!"
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
