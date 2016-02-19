//
//  TableViewController.swift
//  EditTables
//
//  Created by Connor Goddard on 19/02/2016.
//  Copyright © 2016 Connor Goddard. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var dates = [NSDate]();

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
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
    
    // CG - 'numberOfRowsInSection' is the EXTERNAL function name, 'section' is the INTERNAL REFERENCE to the value passed in (int in this case).
    // CG - Example of call to this function (managed by iOS): tableView(tableView, numberOfRowsInSection: 0)
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //if section == 0 ...
        return dates.count
    }
    
    func getStringDate(dateToConvert: NSDate) -> String {
        
        // CG - Create a new NSDateFormatter to perform our string formatting for the NSDate object.
        let dateFormatter = NSDateFormatter()
        
        // CG - Use the current locale running on the phone.
        dateFormatter.locale = NSLocale.currentLocale()
        
        // CG - Use the full date style.
        dateFormatter.dateStyle = NSDateFormatterStyle.FullStyle
        
        return dateFormatter.stringFromDate(dateToConvert);
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        // CG - Set the text of the current cell to the date it represents in the array.
        cell.textLabel?.text = getStringDate(dates[indexPath.row])

        return cell
        
    }
    
    @IBAction func addButtonPressed(sender: AnyObject) {
        
        dates.insert(NSDate(), atIndex: 0)
        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
        self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    //Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == .Delete {
            
            
            // CG - Remove the element from the 'dates' array at the index specified by the row in the table.
            dates.removeAtIndex(indexPath.row)
            
            //Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            
        }
        
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
        
        // CG - Remove the date located at the given index.
        let cutDate = dates.removeAtIndex(fromIndexPath.row)
        
        // CG - Re-insert the extracted date back into the array at the new position.
        dates.insert(cutDate, atIndex: toIndexPath.row)
        
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Connor's Header"
    }
    
    // override func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
    //   return "Connor's Footer"
    // }


    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
