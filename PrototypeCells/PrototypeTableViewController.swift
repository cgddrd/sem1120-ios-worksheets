//
//  PrototypeTableViewController.swift
//  PrototypeCells
//
//  Created by Connor Goddard on 17/02/2016.
//  Copyright © 2016 Connor Goddard. All rights reserved.
//

import UIKit

class PrototypeTableViewController: UITableViewController {
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1000
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell : UITableViewCell;
        
        if indexPath.row % 2 == 0 {
        
            // CG - Either create a new cell for the given identifier ("Cell"), or reuse a new one that has now left the visible area of the screen.
            cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
            cell.textLabel!.text = "Cell \(indexPath.section),\(indexPath.row)"
        
        } else {
        
            cell = tableView.dequeueReusableCellWithIdentifier("SecondCell", forIndexPath: indexPath)
            cell.textLabel!.text = "SecondCell \(indexPath.section),\(indexPath.row)"
        
        }
        
        return cell
    
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            
        let detailScreen = segue.destinationViewController as? DetailViewController
        
        if let indexPath = self.tableView.indexPathForSelectedRow {
           detailScreen?.detailItem = "Cell Row: \(indexPath.row)!"
        }
            
    }
}

