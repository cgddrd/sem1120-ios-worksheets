//
//  ViewController.swift
//  CoreData-Example
//
//  Created by Connor Goddard on 24/02/2016.
//  Copyright © 2016 Connor Goddard. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    var managedContext : NSManagedObjectContext! = nil;
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        createData()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createData() {
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        managedContext = appDelegate.managedObjectContext
        
        let speakerEntity = NSEntityDescription.entityForName("Speaker", inManagedObjectContext: managedContext)
        
        let newSpeaker = Speaker(entity: speakerEntity!, insertIntoManagedObjectContext: managedContext)
        
        newSpeaker.email = "clg11@aber.ac.uk"
        newSpeaker.forename = "Connor"
        newSpeaker.surname = "Goddard"
        newSpeaker.biography = "A bit about me..."
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            NSLog("Error whilst saving data: \(error)")
        }
        
    }
    

}

