//
//  CreateContactInteractorTests.swift
//  ContactsAppTests
//
//  Created by Dim San Cing on 5/12/22.
//

import XCTest

@testable import ContactsApp
class CreateContactInteractorTests: XCTestCase {

    var sut : CreateContactInteractor?
    var networkManager : NetworkManager!
    var contactsRepository: ContactsRepository!

    override func setUpWithError() throws {
        contactsRepository = ContactsRepository()
        networkManager = NetworkManager()
        sut = CreateContactInteractor(service: networkManager, contactsRepository: contactsRepository)
        sut?.presenter = CreateContactPresenter()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testGetRouteForContact(){
        sut?.createContact(firstName: "Ruth", lastName: "San San")
    }

}
