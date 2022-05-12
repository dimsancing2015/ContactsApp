//
//  EditContactInteractorTests.swift
//  ContactsAppTests
//
//  Created by Dim San Cing on 5/12/22.
//

import XCTest
@testable import ContactsApp
class EditContactInteractorTests: XCTestCase {

    var sut : EditContactInteractor?
    var networkManager : NetworkManager!
    var contactsRepository: ContactsRepository!

    override func setUpWithError() throws {
        contactsRepository = ContactsRepository()
        networkManager = NetworkManager()
        sut = EditContactInteractor(service: networkManager, contactsRepository: contactsRepository)
        sut?.presenter = EditContactPresenter()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testGetRouteForContact(){
        sut?.updateContact(id: 128, firstName: "Ruth", lastName: "SanSan")
    }


}
