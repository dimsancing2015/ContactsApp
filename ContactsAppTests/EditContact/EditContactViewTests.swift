//
//  EditContactViewTests.swift
//  ContactsAppTests
//
//  Created by Dim San Cing on 5/12/22.
//

import XCTest

@testable import ContactsApp
class EditContactViewTests: XCTestCase {
    
    var sut : EditContactView?
    var mockEditContactModule : MockEditContactModule?
    var btn : UIButton?

    override func setUpWithError() throws {
        mockEditContactModule = MockEditContactModule()
        let datum = Datum(id: 1234, email: "lia.dimsancing@gmail.com", firstName: "DimSan", lastName: "Cing", avatar: "https://reqres.in/img/faces/7-image.jpg")
        sut = mockEditContactModule?.build(contactsDetail: datum) as? EditContactView
        btn = UIButton()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testEditContactViewUIFunctionalities(){
        
        //sut?.btnDone(btn as Any)
        sut?.btnCancel(btn as Any)
        //sut?.viewDidLoad()
        
        sut?.displayUpdateContact(message: " Unit Test")
    }

    class MockEditContactModule : EditContactModule{
        
    }

}
