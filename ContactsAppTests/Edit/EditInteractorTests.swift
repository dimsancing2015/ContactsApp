//
//  EditInteractorTests.swift
//  ContactsAppTests
//
//  Created by Dim San Cing on 5/12/22.
//

import XCTest
@testable import ContactsApp
class EditInteractorTests: XCTestCase {

    var sut : EditInteractor?
    var networkManager : NetworkManager!
    var contactsRepository: ContactsRepository!

    override func setUpWithError() throws {
        contactsRepository = ContactsRepository()
        networkManager = NetworkManager()
        sut = EditInteractor(service: networkManager, contactsRepository: contactsRepository)
        sut?.presenter = EditPresenter()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_edit(){
        sut?.update(id: 128, firstName: "Ruth", lastName: "SanSan")
    }


}
