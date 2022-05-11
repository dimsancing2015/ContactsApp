//
//  contactsRepositoryTests.swift
//  ContactsAppTests
//
//  Created by Dim San Cing on 5/11/22.
//

import XCTest
import CoreData
@testable import ContactsApp

class contactsRepositoryTests: XCTestCase {

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

}
