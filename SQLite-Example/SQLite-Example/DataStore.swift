//
//  DataStore.swift
//  SQLite-Example
//
//  Created by Connor Goddard on 24/02/2016.
//  Copyright © 2016 Connor Goddard. All rights reserved.
//

import Foundation

class DataStore {
    
    private var database : COpaquePointer = nil
    
    init() {
        
        let bundle = NSBundle.mainBundle()
        let bundleURL = bundle.URLForResource("iOSDevUK2014", withExtension: "sqlite3")!.absoluteString
        
        print("The bundle url is: \(bundleURL)")
        
        let result = sqlite3_open(bundleURL, &database)
        
        if result != SQLITE_OK {
            hardFail("Unable to open the database.")
        }
        
    }
    
    /**
     * Simple failure method that will close the database, display
     * an error message and then abort the application.
     */
    private func hardFail(message: String) {
        sqlite3_close(database)
        print(message)
        abort() // handle the error in a better way...
    }
    
    /**
     * Utility method that is used to extract text from a sqlite3 result
     * statement and turn this into a String.
     */
    private func getTextValue(statement: COpaquePointer, atColumnIndex index: Int32) -> String? {
            let data = sqlite3_column_text(statement, index)
            let value = String.fromCString(UnsafePointer<CChar>(data))
            return value
    }
    
    /**
     * This example shows how to run a query for the SessionItems. The query is more
     * complex than the one shown in the lectures, because it also links in the
     * associated location for the lecture.
     *
     * The method returns an array of SessionItem objects, where each SessionItem has
     * an associated Location.
     */
    func sessionItemList() -> [SessionItem]? {
        
        let query = "SELECT S.id, title, content, dayId, L.id, L.name, L.latitude, L.longitude " +
            " FROM SessionItem as S, Location as L WHERE S.locationId = L.id " +
        " ORDER BY dayId, sessionOrder"
        
        var statement: COpaquePointer = nil
        
        let result = sqlite3_prepare_v2(database, query, -1, &statement, nil)
        
        if result == SQLITE_OK {
            
            var resultList = [SessionItem]()
            
            while sqlite3_step(statement) == SQLITE_ROW {
                
                let sessionItem = SessionItem()
                sessionItem.id = getTextValue(statement, atColumnIndex: 0)
                sessionItem.title = getTextValue(statement, atColumnIndex: 1)
                sessionItem.content = getTextValue(statement, atColumnIndex: 2)
                sessionItem.dayId = Int(sqlite3_column_int(statement, 3))
                
                let location = Location()
                location.id = getTextValue(statement, atColumnIndex: 4)
                location.title = getTextValue(statement, atColumnIndex: 5)
                location.latitude = Double(sqlite3_column_double(statement, 6))
                location.longitude = Double(sqlite3_column_double(statement, 7))
                
                sessionItem.location = location
                
                resultList.append(sessionItem)
            }
            
            sqlite3_finalize(statement)
            
            return resultList
        }
        
        return nil
    }
    
    /**
     * Example of preparing a statement to be sent to the database, which will
     * make a change to the content of a database table. This example uses an
     * Update statement. In addition to the COpaquePointer type, used for the
     * statement, this extract also shows how to convert a Swift string into
     * a UTF8String that is suitable for sending to SQLite.
     */
    func modifyTitle(title: String, forId id: String) {
        
        let query = "UPDATE SessionItem SET title = ? where id = ?"
        
        var statement: COpaquePointer = nil
        
        if sqlite3_prepare_v2(database, query, -1, &statement, nil) == SQLITE_OK {
            
            // the following two lines use (x as NSString).UTF8String in order
            // to conver the Swift String into a UTF8 String that will be
            // understood by C.
            sqlite3_bind_text(statement, 1, (title as NSString).UTF8String, -1, nil)
            sqlite3_bind_text(statement, 2, (id as NSString).UTF8String, -1, nil)
            
            if sqlite3_step(statement) != SQLITE_DONE {
                hardFail("Unable to update the database")
            }
            
            sqlite3_finalize(statement)
        }
        
    }
    
}
