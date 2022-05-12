//
//  CreateViewTests.swift
//  ContactsAppTests
//
//  Created by Dim San Cing on 5/12/22.
//

import XCTest

@testable import ContactsApp
class CreateViewTests: XCTestCase {
    
    var sut : CreateView?
    var mockCreateModule : MockCreateModule?
    var btn : UIButton?

    override func setUpWithError() throws {
        mockCreateModule = MockCreateModule()
        sut = mockCreateModule?.build() as? CreateView
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

    class MockCreateModule : CreateModule{
        
    }

}
