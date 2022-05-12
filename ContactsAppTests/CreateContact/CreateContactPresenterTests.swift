//
//  CreateContactPresenterTests.swift
//  ContactsAppTests
//
//  Created by Dim San Cing on 5/12/22.
//

import XCTest

@testable import ContactsApp
class CreateContactPresenterTests: XCTestCase {

    var sut: CreateContactPresenter?
    var mockRouter: MockCreateContactRouter?
    var interactor: CreateContactInteractor?
    var networkManager : NetworkManager!
    var contactsRepository: ContactsRepository!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        contactsRepository = ContactsRepository()
        sut = CreateContactPresenter()
        mockRouter = MockCreateContactRouter()
        networkManager = NetworkManager()
        sut?.interactor = CreateContactInteractor(service: networkManager, contactsRepository: contactsRepository)
        
        sut?.router = mockRouter
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        mockRouter = nil
    }
    
    func testWhenPresenterRouteByRouters(){
        
        sut?.createContact(firstName: "SanSan", lastName: "JM")
        //sut?.doneCreate(message: "Succssfuly Create New Contact")
        
    }
    
    class MockCreateContactRouter: CreateContactRouter{
        
    }

}
