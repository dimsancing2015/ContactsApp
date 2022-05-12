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
        
        sut?.alert(message: " Alert Test")
        
        let datum = Datum(id: 1234, email: "lia.dimsancing@gmail.com", firstName: "DimSan", lastName: "Cing", avatar: "https://reqres.in/img/faces/7-image.jpg")
        let support = Support(url: "https://reqres.in/img/faces/7-image.jpg", text: "Test")
        let contactList = ContactsList(page: 2, perPage: 10, total: 2, totalPages: 10, data: [datum], support: support)
        sut?.displayContactsList(contactsList: contactList)
    }

    class MockHomeModule : HomeModule{
        
    }

}
