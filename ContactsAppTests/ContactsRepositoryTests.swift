//
//  ContactsRepositoryTests.swift
//  ContactsAppTests
//
//  Created by Dim San Cing on 5/11/22.
//

import XCTest
import CoreData
@testable import ContactsApp

class ContactsRepositoryTests: XCTestCase {

    var contactsRepository: ContactsRepository!
    
    override func setUp() {
        super.setUp()
        
        contactsRepository = ContactsRepository.sharedManager
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_init_Repository(){
        let instance = ContactsRepository.sharedManager
        
        XCTAssertNotNil( instance )
    }
    
    func test_coreDataStackInitialization() {
        let coreDataStack = ContactsRepository.sharedManager.persistentContainer
        
        XCTAssertNotNil( coreDataStack )
    }
    
    func test_create_contact() {
        let id1 = 123
        let firstName1 = "Ruth"
        let lastName1 = "SanSan"
        
        let id2 = 124
        let firstName2 = "David"
        let lastName2 = "JM"
        
        let id3 = 125
        let firstName3 = "Sam"
        let lastName3 = "John"
        
        let contact1: () = contactsRepository.create(id: id1, firstName: firstName1, lastName: lastName1)
        XCTAssertNotNil(contact1)
        
        let contact2: () = contactsRepository.create(id: id2, firstName: firstName2, lastName: lastName2)
        XCTAssertNotNil(contact2)
        
        let contact3: () = contactsRepository.create(id: id3, firstName: firstName3, lastName: lastName3)
        XCTAssertNotNil(contact3)
    }
    
    func test_fetch_contact() {
        let results = contactsRepository.find(id: 123)
        XCTAssertEqual(results?.id, 123)
    }
    
    
        func test_update_contact(){
    
            let items = contactsRepository.find(id: 123)
            let updateContact2: () = contactsRepository.update(id: 123, firstName: "Peter", lastName: "Lim")
            let itemsFetched = contactsRepository.find(id: 123)
            
            XCTAssertEqual(items?.firstName,itemsFetched?.firstName)
            XCTAssertEqual(items?.lastName, itemsFetched?.lastName)
    
        }

}
