//
//  EditContractPresenterTests.swift
//  ContactsAppTests
//
//  Created by Dim San Cing on 5/12/22.
//

import XCTest
@testable import ContactsApp
class EditContractPresenterTests: XCTestCase {

    var sut: EditContactPresenter?
    var mockRouter: MockEditContactRouter?
    var interactor: CreateContactInteractor?
    var networkManager : NetworkManager!
    var contactsRepository: ContactsRepository!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = EditContactPresenter()
        mockRouter = MockEditContactRouter()
        contactsRepository = ContactsRepository()
        networkManager = NetworkManager()
        sut?.interactor = EditContactInteractor(service: networkManager, contactsRepository: contactsRepository)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        mockRouter = nil
    }
    
    func testWhenPresenterRouteByRouters(){
        //let datum = Datum(id: 1234, email: "lia.dimsancing@gmail.com", firstName: "DimSan", lastName: "Cing", avatar: "https://reqres.in/img/faces/7-image.jpg")
        sut?.saveEditContact(id: 1245, firstName: "Dim San", lastName: "Cing")
        
    }
    
    class MockEditContactRouter: EditContactRouter{
        
    }

}
