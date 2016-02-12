//
//  ViewController.swift
//  HelloWorld
//
//  Created by Connor Goddard on 12/02/2016.
//  Copyright © 2016 Connor Goddard. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    // CG - IBOutlets represent "links" to the UI components.
    @IBOutlet weak var worldImage: UIImageView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var messageLabel: UILabel!

    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonPressed(sender: AnyObject) {
        
        if let text = textField.text where !text.isEmpty {
            
            messageLabel.text = "Hello, \(textField.text!)";
            
        } else {
            // CG - Create the alert.
            let alert = UIAlertController(title: "Error", message: "Textbox is empty.", preferredStyle: UIAlertControllerStyle.Alert)
            
            // CG - Add an action (button).
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            
            // CG - Show the alert.
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
    }

    @IBAction func segControlPressed(sender: AnyObject) {
        
        let segmentControl = sender as? UISegmentedControl;
        
        let segmentIndex = segmentControl?.selectedSegmentIndex;
        
        if (segmentIndex == 0) {
            
            worldImage.image = UIImage(named: "World_Image_1")
            
        } else {
            
            worldImage.image = UIImage(named: "World_Image_2")

        }
    }
    
    // CG - This function is part of the 'UITextFieldDelegate' protocol, which we have set as a delegate on the textfield component in order for it to be linked with the protocol, and allow this function to "listen" for events from the textfield component on the UI.
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        // CG - Trigger a 'press' event on the button.
        buttonPressed(self)
        
        // CG - Remove the keyboard from the screen.
        textField.resignFirstResponder()
        
        // Return true as we want to allow the textfield to return.
        return true
    }

}

