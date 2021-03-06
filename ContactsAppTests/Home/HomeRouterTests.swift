//
//  HomeRouterTests.swift
//  ContactsAppTests
//
//  Created by Dim San Cing on 5/12/22.
//

import XCTest

@testable import ContactsApp
class HomeRouterTests: XCTestCase {

    var sut : HomeRouter?

    override func setUpWithError() throws {
        sut = HomeRouter()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testHomeRouterRouting(){
        let contact = Contact(id: 1234, email: "lia.dimsancing@gmail.com", firstName: "DimSan", lastName: "Cing", avatar: "https://reqres.in/img/faces/7-image.jpg")
        sut?.goToCreate()
        sut?.goToDetail(contactDetail: contact)
    }
}
