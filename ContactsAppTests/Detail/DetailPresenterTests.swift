//
//  DetailPresenterTests.swift
//  ContactsAppTests
//
//  Created by Dim San Cing on 5/12/22.
//

import XCTest
@testable import ContactsApp
class DetailPresenterTests: XCTestCase {

    var sut: DetailPresenter?
    var mockRouter: MockDetailRouter?

    override func setUpWithError() throws {
        sut = DetailPresenter()
        mockRouter = MockDetailRouter()
        sut?.router = mockRouter
    }

    override func tearDownWithError() throws {
        sut = nil
        mockRouter = nil
    }
    
    func testWhenPresenterRouteByRouters(){
        let contact = Contact(id: 1234, email: "lia.dimsancing@gmail.com", firstName: "DimSan", lastName: "Cing", avatar: "https://reqres.in/img/faces/7-image.jpg")
        sut?.goToEdit(contactsDetail: contact)
        
    }
    
    class MockDetailRouter: DetailRouter{
        
    }

}
