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
    
    var names: [String: String] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData();
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let namerScreen = segue.destinationViewController as? NamerViewController
        namerScreen?.view.backgroundColor = self.view.backgroundColor;
        
        if let colourValue = names[getColourKey()] {
            namerScreen?.colourNameTextField?.text = colourValue
        }
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
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
    
    func getColour() -> UIColor {
        
        return UIColor(red: CGFloat(redSlider.value),
                       green: CGFloat(greenSlider.value),
                       blue: CGFloat(blueSlider.value),
                       alpha: CGFloat(1.0))
    
    }
    
    func updateBackgroundColour() {
        self.view.backgroundColor = getColour()
        
        if let colourValue = names[getColourKey()] {
            
            colourLabel.text = "Current Colour: \(colourValue)"
            
        } else {
            
            colourLabel.text = "Current Colour: Unknown"
            
        }
    }
    
    func setCurrentName(name: String) {
        
        colourLabel.text = "Current: \(name)"
        names[getColourKey()] = name;
        
        // CG - Once we have assigned the new colour name, save it to the filestore.
        saveData();
        
    }
    
    func getColourKey() -> String {
        
        return String(format: "%.1f-%.1f-%.1f",
            Double:(redSlider.value * 255),
            Double:(greenSlider.value * 255),
            Double:(blueSlider.value * 255))
        
    }
    
    func saveData() {
        
//        let documentsURL = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0]
//        
//        let fileURL = documentsURL.URLByAppendingPathComponent("Colours.plist");
//        
//        let namesDictionary = names as NSDictionary
//        namesDictionary.writeToURL(fileURL, atomically: true)
//        
//        print("Documents Path: \(documentsURL)")
        
        // CG - Make use of NSUserDefaults rather than writing to custom file location.
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(names, forKey: "ColourNames")
        
    }
    
    func loadData() {
        
//        let documentsURL = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0]
//        
//        let fileURL = documentsURL.URLByAppendingPathComponent("Colours.plist")
//        
//        if let dictionaryNames = (NSDictionary(contentsOfFile: fileURL.path!) as? Dictionary<String, String>) {
//            
//            names = dictionaryNames;
//        }
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        if let dictionary = defaults.dictionaryForKey("ColourNames") {
            
            names = dictionary as! Dictionary<String, String>
            
        }
    
    }
    
    // CG - These two functions use @IBOutlet to make them visible to the 'Exit facility' from the other view.
    @IBAction func setColourName(segue: UIStoryboardSegue) {
        
        let source = segue.sourceViewController as? NamerViewController
        
        if let name = source?.colourNameTextField?.text {
            setCurrentName(name)
        } else {
            setCurrentName("Unknown")
        }
    }
    
    @IBAction func cancelSetColourName(segue: UIStoryboardSegue) {
        // CG - No action for this.
    }

}

