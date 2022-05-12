//
//  EditPresenterTests.swift
//  ContactsAppTests
//
//  Created by Dim San Cing on 5/12/22.
//

import XCTest
@testable import ContactsApp
class EditPresenterTests: XCTestCase {

    var sut: EditPresenter?
    var mockRouter: MockEditRouter?
    var interactor: CreateInteractor?
    var networkManager : NetworkManager!
    var contactsRepository: ContactsRepository!

    override func setUpWithError() throws {
        sut = EditPresenter()
        mockRouter = MockEditRouter()
        contactsRepository = ContactsRepository()
        networkManager = NetworkManager()
        sut?.interactor = EditInteractor(service: networkManager, contactsRepository: contactsRepository)
    }

    override func tearDownWithError() throws {
        sut = nil
        mockRouter = nil
    }
    
    func testWhenPresenterRouteByRouters(){
        sut?.saveEdit(id: 1245, firstName: "Dim San", lastName: "Cing")
        
    }
    
    class MockEditRouter: EditRouter{
        
    }

}
