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
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = HomePresenter()
        mockRouter = MockHomeRouter()
        sut?.router = mockRouter
       
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        mockRouter = nil
    }
    
    func testWhenPresenterRouteByRouters(){
        let datum = Datum(id: 1234, email: "lia.dimsancing@gmail.com", firstName: "DimSan", lastName: "Cing", avatar: "https://reqres.in/img/faces/7-image.jpg")
        let support = Support(url: "https://reqres.in/img/faces/7-image.jpg", text: "Test")
        //let contactList = ContactsList(page: 2, perPage: 10, total: 2, totalPages: 10, data: [datum], support: support)
        sut?.addContact()
        sut?.contactsDetail(contactDetail: datum)
        //sut?.contactsList(contactsList: contactList)
        
    }
    
    class MockHomeRouter: HomeRouter{
        
    }

}
