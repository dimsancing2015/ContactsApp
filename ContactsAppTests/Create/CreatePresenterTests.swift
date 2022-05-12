//
//  CreatePresenterTests.swift
//  ContactsAppTests
//
//  Created by Dim San Cing on 5/12/22.
//

import XCTest

@testable import ContactsApp
class CreatePresenterTests: XCTestCase {

    var sut: CreatePresenter?
    var mockRouter: MockCreateRouter?
    var interactor: CreateInteractor?
    var networkManager : NetworkManager!
    var contactsRepository: ContactsRepository!
    
    override func setUpWithError() throws {
        contactsRepository = ContactsRepository()
        sut = CreatePresenter()
        mockRouter = MockCreateRouter()
        networkManager = NetworkManager()
        sut?.interactor = CreateInteractor(service: networkManager, contactsRepository: contactsRepository)
        sut?.router = mockRouter
    }

    override func tearDownWithError() throws {
        sut = nil
        mockRouter = nil
    }
    
    func testWhenPresenterRouteByRouters(){
        sut?.create(firstName: "SanSan", lastName: "JM")
        //sut?.doneCreate(message: "Succssfuly Create New Contact")
    
    }
    
    class MockCreateRouter: CreateRouter{
        
    }

}
