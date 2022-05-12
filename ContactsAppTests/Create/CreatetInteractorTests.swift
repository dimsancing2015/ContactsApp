//
//  CreateInteractorTests.swift
//  ContactsAppTests
//
//  Created by Dim San Cing on 5/12/22.
//

import XCTest

@testable import ContactsApp
class CreateInteractorTests: XCTestCase {

    var sut : CreateInteractor?
    var networkManager : NetworkManager!
    var contactsRepository: ContactsRepository!

    override func setUpWithError() throws {
        contactsRepository = ContactsRepository()
        networkManager = NetworkManager()
        sut = CreateInteractor(service: networkManager, contactsRepository: contactsRepository)
        sut?.presenter = CreatePresenter()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testGetRouteForCreate(){
        sut?.create(firstName: "Ruth", lastName: "San San")
    }

}
