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
        let speakerFetch = NSFetchRequest(entityName: "Speaker")
        
        do {
            
            let result = try managedContext.executeFetchRequest(speakerFetch) as? [Speaker]
            
            if let speakers = result {
                
                if speakers.count == 0 {
                    
                    let aSpeaker = Speaker(entity: speakerEntity!, insertIntoManagedObjectContext: managedContext)
                    
                    aSpeaker.email = "nst@aber.ac.uk"
                    aSpeaker.forename = "Neil"
                    aSpeaker.surname = "Taylor"
                    aSpeaker.biography = "This is a longer bit of text..."
                    
                    try managedContext.save()
                    
                } else {
                    
                    print("We have \(speakers.count) speakers")
                    
                    for speaker in speakers {
                        
                        print("Speaker is: \(speaker.email)")
                        // check that the other items have also been stored
                    }
                    
                }
            }
            
            
        } catch let error as NSError {
            NSLog("Error whilst saving data: \(error)")
        }
        
    }
    
    func outputSpeakers() {
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        managedContext = appDelegate.managedObjectContext
        
        do {
        
        let speakerFetch = NSFetchRequest(entityName: "Speaker")
        let retrievedSpeakers = try managedContext.executeFetchRequest(speakerFetch) as? [Speaker]
        
        // CG - Here we are going to filter results by email address.
        let speakerEmailFilterString = "clg11@aber.ac.uk"
        speakerFetch.predicate = NSPredicate(format: "email == %@", speakerEmailFilterString)
        
        if let speakers = retrievedSpeakers {
            
            if speakers.count == 0 {
                print("No speakers to print.")
            } else {
                
                for speaker in speakers {
                    
                    print("Speaker is: \(speaker.email)")
                    
                    // CG - This is a nicer way of checking if an NSSet is set or not, before casting to an array. (Credit to: Sam Jackson (slj11) for this).
                    if let talks = speaker.talks?.allObjects as? [Talk] {
                        
                        for talk in talks {
                            
                            print("Talk: \(talk.title)")
                            
                        }
                        
                    }
                    
                    

                }
            }
        }
            
        } catch let error as NSError {
            NSLog("Error whilst printing Speaker results: \(error)")
        }
        
        
    }
    
    @IBAction func addNewSpeaker(segue: UIStoryboardSegue) {
        
        let source = segue.sourceViewController as? AddSpeakerViewController
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        managedContext = appDelegate.managedObjectContext
        
        let speakerEntity = NSEntityDescription.entityForName("Speaker", inManagedObjectContext: managedContext)
        
        let newSpeaker = Speaker(entity: speakerEntity!, insertIntoManagedObjectContext: managedContext)
        
        let talkEntity = NSEntityDescription.entityForName("Talk", inManagedObjectContext: managedContext)
        let newTalk = Talk(entity: talkEntity!, insertIntoManagedObjectContext: managedContext)
        
        newSpeaker.email = source?.textEmail.text
        newSpeaker.forename = source?.textFirstName.text
        newSpeaker.surname = source?.textSurname.text
        newSpeaker.biography = source?.textDescription.text
        
        newTalk.title = "My new title!";
        newTalk.abstract = "This is the talk abstract."
        
        // CG: 
        // 1) Here we cast 'newSpeaker.talks' to an NSMutableSet so we can edit it.
        // 2) Make the change (in this case add a new talk)
        // 3) Convert 'talks' BACK TO AN IMMUTABLE 'NSSet' so we can save it using Core Data.
        
        let talks = newSpeaker.talks?.mutableCopy() as! NSMutableSet
        talks.addObject(newTalk);
        newSpeaker.talks = talks as NSSet
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print ("SOMETHING WENT WRONG: \(error)")
        }
        
        outputSpeakers()
    
    }
    

}

