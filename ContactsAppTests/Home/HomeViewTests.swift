//
//  HomeViewTests.swift
//  ContactsAppTests
//
//  Created by Dim San Cing on 5/12/22.
//

import XCTest
@testable import ContactsApp
class HomeViewTests: XCTestCase {
    
    var sut : HomeView?
    var mockHomeModule : MockHomeModule?
    var btn : UIButton?

    override func setUpWithError() throws {
        mockHomeModule = MockHomeModule()
        sut = mockHomeModule?.build() as? HomeView
        btn = UIButton()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testHomeViewUIFunctionalities(){
        
        sut?.btnAdd(btn as Any)
        sut?.viewDidLoad()
    }

    class MockHomeModule : HomeModule{
        
    }

}
