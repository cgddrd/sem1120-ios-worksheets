//
//  AddSpeakerViewController.swift
//  CoreData-Example
//
//  Created by Connor Goddard on 26/02/2016.
//  Copyright © 2016 Connor Goddard. All rights reserved.
//

import UIKit

class AddSpeakerViewController: UIViewController {

    @IBOutlet weak var textFirstName: UITextField!
    @IBOutlet weak var textSurname: UITextField!
    @IBOutlet weak var textEmail: UITextField!
    @IBOutlet weak var textDescription: UITextField!
    
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
