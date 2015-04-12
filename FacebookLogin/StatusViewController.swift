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
