//
//  ContactDetailRouterTests.swift
//  ContactsAppTests
//
//  Created by Dim San Cing on 5/12/22.
//

import XCTest
@testable import ContactsApp
class ContactDetailRouterTests: XCTestCase {
    
    var sut : ContactDetailRouter?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = ContactDetailRouter()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }
    
    func testHomeRouterRouting(){
        let datum = Datum(id: 1234, email: "lia.dimsancing@gmail.com", firstName: "DimSan", lastName: "Cing", avatar: "https://reqres.in/img/faces/7-image.jpg")
        sut?.goToEdit(contactsDetail: datum)
    }
}
