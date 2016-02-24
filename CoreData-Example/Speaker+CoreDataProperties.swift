//
//  Speaker+CoreDataProperties.swift
//  CoreData-Example
//
//  Created by Connor Goddard on 24/02/2016.
//  Copyright © 2016 Connor Goddard. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Speaker {

    @NSManaged var biography: String?
    @NSManaged var email: String?
    @NSManaged var forename: String?
    @NSManaged var surname: String?

}
