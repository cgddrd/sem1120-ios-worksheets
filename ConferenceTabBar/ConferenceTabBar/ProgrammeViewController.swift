//
//  FirstViewController.swift
//  ConferenceTabBar
//
//  Created by Connor Goddard on 19/02/2016.
//  Copyright © 2016 Connor Goddard. All rights reserved.
//

import UIKit

class ProgrammeViewController: UITableViewController {
    
    let talkData = TalksData().talks;

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return talkData.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // CG - Either create a new cell for the given identifier ("cell"), or reuse a new one that has now left the visible area of the screen.
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        let speakers = talkData[indexPath.row].getSpeakerNames()
        
        cell.textLabel?.text = talkData[indexPath.row].title
        cell.detailTextLabel?.text = "\(speakers) - \(talkData[indexPath.row].startTime)"
        
        return cell
        
    }


}

