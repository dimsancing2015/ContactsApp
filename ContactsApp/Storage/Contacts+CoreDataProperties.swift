//
//  Contacts+CoreDataProperties.swift
//  ContactsApp
//
//  Created by Dim San Cing on 5/11/22.
//
//

import Foundation
import CoreData


extension Contacts {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Contacts> {
        return NSFetchRequest<Contacts>(entityName: "Contacts")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?

}

extension Contacts : Identifiable {

}
