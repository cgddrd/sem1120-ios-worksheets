//
//  TableViewController.swift
//  SQLite-Example
//
//  Created by Connor Goddard on 24/02/2016.
//  Copyright © 2016 Connor Goddard. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var dataStore = DataStore();
    var sessionList : [SessionItem] = []

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        refreshData();
        
        //self.navigationItem.leftBarButtonItem = self.editButtonItem()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    // CG - Make sure to refresh the cached collection of session items when we make a change to the database.
    func refreshData() {
        
        sessionList = dataStore.sessionItemList()!;
        self.tableView.reloadData();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return sessionList.count;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        // CG - Set the text of the current cell to the date it represents in the array.
        cell.textLabel?.text = sessionList[indexPath.row].title
        cell.detailTextLabel?.text = sessionList[indexPath.row].content
        
        return cell
        
    }
    
//    // Override to support editing the table view.
//    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
//        
//        let currentSession = sessionList[indexPath.row];
//        
//        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
//        
//        dataStore.modifyTitle((cell.textLabel?.text)!, forId: currentSession.id);
//        
//        self.tableView.reloadData();
//        
//    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let currentSession = sessionList[indexPath.row];
        
        dataStore.modifyTitle("Modified: \(currentSession.title)", forId: currentSession.id);
        
        refreshData();
        
    }

}
