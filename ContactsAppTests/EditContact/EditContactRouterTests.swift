//
//  EditContactRouterTests.swift
//  ContactsAppTests
//
//  Created by Dim San Cing on 5/12/22.
//

import XCTest

@testable import ContactsApp
class EditContactRouterTests: XCTestCase {

    var sut : EditContactRouter?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = EditContactRouter()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }
    
    func testEditContactRouterRouting(){
    
    }
}
