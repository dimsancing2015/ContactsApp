//
//  ContactsRepository.swift
//  ContactsApp
//
//  Created by Dim San Cing on 5/11/22.
//

import Foundation
import CoreData

class ContactsRepository {
    static let sharedManager = ContactsRepository()
    init() {}
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ContactsApp")
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    func create(id:Int, firstName: String, lastName: String) {
        
        let managedContext = ContactsRepository.sharedManager.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Contacts", in: managedContext)!
        
        let user = NSManagedObject(entity: entity, insertInto: managedContext)
        user.setValue(id, forKey: "id")
        user.setValue(firstName, forKey: "firstName")
        user.setValue(lastName, forKey: "lastName")
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    
    func findUser(id: Int) -> Contacts? {
        
        let managedContext = ContactsRepository.sharedManager.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Contacts")
        
        fetchRequest.predicate = NSPredicate(format: "id =%d", id)
        do {
            let response = try managedContext.fetch(fetchRequest)
            return response.count > 0 ? response[0] as? Contacts : nil
            
        }catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            return nil
        }
    }
    
    func update(id: Int, firstName : String, lastName: String){
        let managedContext = ContactsRepository.sharedManager.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Contacts")
        fetchRequest.predicate = NSPredicate(format: "id =%d", id)
        do {
            let response = try managedContext.fetch(fetchRequest)
            if response.count != 0{
                let userInfo = response[0]
                userInfo.setValue(firstName, forKey: "firstName")
                userInfo.setValue(lastName, forKey: "lastName")
                do {
                    try managedContext.save()
                } catch let error as NSError {
                    print("Could not update. \(error), \(error.userInfo)")
                }
            }
        }catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
}

