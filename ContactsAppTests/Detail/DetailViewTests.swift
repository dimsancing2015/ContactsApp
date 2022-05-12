//
//  ContactDetailViewTests.swift
//  ContactsAppTests
//
//  Created by Dim San Cing on 5/12/22.
//

import XCTest

@testable import ContactsApp
class DetailViewTests: XCTestCase {
    
    var sut : DetailView?
    var mockDetailModule : MockDetailModule?
    var btn : UIButton?

    override func setUpWithError() throws {
        mockDetailModule = MockDetailModule()
        let contact = Contact(id: 1234, email: "lia.dimsancing@gmail.com", firstName: "DimSan", lastName: "Cing", avatar: "https://reqres.in/img/faces/7-image.jpg")
        sut = mockDetailModule?.build(contactDetail: contact) as? DetailView
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

    class MockDetailModule : DetailModule{
        
    }

}
