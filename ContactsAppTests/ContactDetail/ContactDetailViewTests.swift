//
//  ContactDetailViewTests.swift
//  ContactsAppTests
//
//  Created by Dim San Cing on 5/12/22.
//

import XCTest

@testable import ContactsApp
class ContactDetailViewTests: XCTestCase {
    
    var sut : ContactDetailView?
    var mockContactDetailModule : MockContactDetailModule?
    var btn : UIButton?

    override func setUpWithError() throws {
        mockContactDetailModule = MockContactDetailModule()
        let datum = Datum(id: 1234, email: "lia.dimsancing@gmail.com", firstName: "DimSan", lastName: "Cing", avatar: "https://reqres.in/img/faces/7-image.jpg")
        sut = mockContactDetailModule?.build(contactDetail: datum) as? ContactDetailView
        btn = UIButton()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testHomeViewUIFunctionalities(){
        
        sut?.btnBack(btn as Any)
        sut?.btnEdit(btn as Any)
        sut?.viewDidLoad()
    }

    class MockContactDetailModule : ContactDetailModule{
        
    }

}
