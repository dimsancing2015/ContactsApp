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
    
    func create(firstName: String, lastName: String) {
        
        let managedContext = ContactsRepository.sharedManager.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Contacts", in: managedContext)!

        let user = NSManagedObject(entity: entity, insertInto: managedContext)
        user.setValue(firstName, forKey: "firstName")
        user.setValue(lastName, forKey: "lastName")
        
        print(" Create")
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    
    func findUser(uid: String) -> Contacts? {
        
        print(" uid >>>", uid)
        let managedContext = ContactsRepository.sharedManager.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Contacts")
        fetchRequest.predicate = NSPredicate(format: "uid ==%@", uid)
        do {
            let response = try managedContext.fetch(fetchRequest)
            return response.count > 0 ? response[0] as? Contacts : nil
            
        }catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            return nil
        }
    }
    
    func updateContacts(newToken : String, uid: String){
       
        let managedContext = ContactsRepository.sharedManager.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Contacts")
        fetchRequest.predicate = NSPredicate(format: "uid ==%@", uid)
        do {
            let response = try managedContext.fetch(fetchRequest)
            if response.count != 0{
                let userInfo = response[0]
                userInfo.setValue(newToken, forKey: "token")
                do {
                    try managedContext.save()
                } catch let error as NSError {
                    print("Could not save. \(error), \(error.userInfo)")
                }
            }
        }catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    
    
//
//    func update(uid: String, userInfo: UserInfo) -> User? {
//        let managedContext = UserRepository.sharedManager.persistentContainer.viewContext
//        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "User")
//        fetchRequest.predicate = NSPredicate(format: "uid ==%@", uid)
//
//        do {
//            let item = try managedContext.fetch(fetchRequest)
//            var arrRemovedPeople = [User]()
//            for i in item {
//
//              /*call delete method(aManagedObjectInstance)*/
//              /*here i is managed object instance*/
//              managedContext.delete(i)
//
//              /*finally save the contexts*/
//              try managedContext.save()
//
//              /*update your array also*/
//              arrRemovedPeople.append(i as! Person)
//            }
//            return arrRemovedPeople
//        } catch let error as NSError {
//            print("Could not fetch . \(error), \(error.userInfo)")
//            return nil
//        }
//    }

}

