//
//  DetailRouterTests.swift
//  ContactsAppTests
//
//  Created by Dim San Cing on 5/12/22.
//

import XCTest
@testable import ContactsApp
class DetailRouterTests: XCTestCase {
    
    var sut : DetailRouter?
    
    override func setUpWithError() throws {
        sut = DetailRouter()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testDetailRouterRouting(){
        let contact = Contact(id: 1234, email: "lia.dimsancing@gmail.com", firstName: "DimSan", lastName: "Cing", avatar: "https://reqres.in/img/faces/7-image.jpg")
        sut?.goToEdit(contactsDetail: contact)
    }
}
