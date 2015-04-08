//
//  BasicInfoViewController.swift
//  FacebookLogin
//
//  Created by Prem on 05/04/15.
//  Copyright (c) 2015 Murugesan, Prem Kumar. All rights reserved.
//

import UIKit

class BasicInfoViewController: UIViewController {

    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    var firstName: String!
    var lastName: String!
    var email: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (firstName != nil){
            firstNameLabel.text = firstName
        }
        if (lastName != nil){
            lastNameLabel.text = lastName
        }
        if (email != nil){
            emailLabel.text = email
        }
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
