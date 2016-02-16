//
//  NamerViewController.swift
//  ColourNamer
//
//  Created by Connor Goddard on 15/02/2016.
//  Copyright © 2016 Connor Goddard. All rights reserved.
//

import Foundation
import UIKit

class NamerViewController : UIViewController {
    
    @IBOutlet var colourNameTextField: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // CG - Auto-trigger keyboard display upon view load.
        colourNameTextField?.becomeFirstResponder();
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
