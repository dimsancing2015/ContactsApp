//
//  CreateContactViewTests.swift
//  ContactsAppTests
//
//  Created by Dim San Cing on 5/12/22.
//

import XCTest

@testable import ContactsApp
class CreateContactViewTests: XCTestCase {
    
    var sut : CreateContactView?
    var mockCreateContactModule : MockCreateContactModule?
    var btn : UIButton?

    override func setUpWithError() throws {
        mockCreateContactModule = MockCreateContactModule()
        sut = mockCreateContactModule?.build() as? CreateContactView
        btn = UIButton()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testHomeViewUIFunctionalities(){
        
        //sut?.btnCreate(btn as Any)
        //sut?.viewDidLoad()
        sut?.doneCreate(message: "Done Created")
        sut?.alert(message: "Alert Test")
    }

    class MockCreateContactModule : CreateContactModule{
        
    }

}
