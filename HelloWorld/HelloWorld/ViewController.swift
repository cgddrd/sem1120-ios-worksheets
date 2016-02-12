//
//  ViewController.swift
//  HelloWorld
//
//  Created by Connor Goddard on 12/02/2016.
//  Copyright © 2016 Connor Goddard. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var worldImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    @IBAction func buttonPressed(sender: AnyObject) {
        
        worldImage.image = UIImage(named: "World_Image_2")
        
    }

}

