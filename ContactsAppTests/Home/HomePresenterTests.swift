//
//  HomePresenterTests.swift
//  ContactsAppTests
//
//  Created by Dim San Cing on 5/12/22.
//

import XCTest

@testable import ContactsApp
class HomePresenterTests: XCTestCase {

    var sut: HomePresenter?
    var mockRouter: MockHomeRouter?

    override func setUpWithError() throws {
        sut = HomePresenter()
        mockRouter = MockHomeRouter()
        sut?.router = mockRouter
    }

    override func tearDownWithError() throws {
        sut = nil
        mockRouter = nil
    }
    
    func testWhenPresenterRouteByRouters(){
        let contact = Contact(id: 1234, email: "lia.dimsancing@gmail.com", firstName: "DimSan", lastName: "Cing", avatar: "https://reqres.in/img/faces/7-image.jpg")
        sut?.add()
        sut?.contactsDetail(contactDetail: contact)
        
    }
    
    class MockHomeRouter: HomeRouter{
        
    }

}
