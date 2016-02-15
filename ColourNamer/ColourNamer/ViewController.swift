//
//  ViewController.swift
//  ColourNamer
//
//  Created by Connor Goddard on 12/02/2016.
//  Copyright © 2016 Connor Goddard. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var colourLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func reset(sender: AnyObject) {
        
        redSlider.value = 0.5
        greenSlider.value = 0.5
        blueSlider.value = 0.5
        
        updateBackgroundColour()
        
    }

    @IBAction func valueChanged(sender: AnyObject) {
        
        updateBackgroundColour()
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let namerScreen = segue.destinationViewController as? NamerViewController
        namerScreen?.view.backgroundColor = self.view.backgroundColor;
        
    }
    
    func getColour() -> UIColor {
        
        return UIColor(red: CGFloat(redSlider.value),
                       green: CGFloat(greenSlider.value),
                       blue: CGFloat(blueSlider.value),
                       alpha: CGFloat(1.0))
    
    }
    
    func updateBackgroundColour() {
        self.view.backgroundColor = getColour()
    }
    
    func setCurrentName(name: String) {
        colourLabel.text = "Current: \(name)"
    }
    
    // CG - These two functions use @IBOutlet to make them visible to the 'Exit facility' from the other view.
    @IBAction func setColourName(segue: UIStoryboardSegue) {
        let source = segue.sourceViewController as? NamerViewController
        
        if var name = source?.colourNameTextField?.text {
            setCurrentName(name)
        } else {
            setCurrentName("Unknown")
        }
    }
    
    @IBAction func cancelSetColourName(segue: UIStoryboardSegue) {
        // CG - No action for this.
    }

}

