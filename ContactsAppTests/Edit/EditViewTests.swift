//
//  EditViewTests.swift
//  ContactsAppTests
//
//  Created by Dim San Cing on 5/12/22.
//

import XCTest

@testable import ContactsApp
class EditViewTests: XCTestCase {
    
    var sut : EditView?
    var mockEditModule : MockEditModule?
    var btn : UIButton?

    override func setUpWithError() throws {
        mockEditModule = MockEditModule()
        let contact = Contact(id: 1234, email: "lia.dimsancing@gmail.com", firstName: "DimSan", lastName: "Cing", avatar: "https://reqres.in/img/faces/7-image.jpg")
        sut = mockEditModule?.build(contactsDetail: contact) as? EditView
        btn = UIButton()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testEditViewUIFunctionalities(){
        sut?.btnCancel(btn as Any)
        sut?.displayUpdate(message: " Unit Test")
    }

    class MockEditModule : EditModule{
        
    }

}
