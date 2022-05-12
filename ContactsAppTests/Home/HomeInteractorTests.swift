//
//  HomeInteractorTests.swift
//  ContactsAppTests
//
//  Created by Dim San Cing on 5/11/22.
//

import XCTest

@testable import ContactsApp
class HomeInteractorTests: XCTestCase {
    
    var sut : HomeInteractor?
    var networkManager : NetworkManager!

    override func setUpWithError() throws {
        networkManager = NetworkManager()
        sut = HomeInteractor(service: networkManager)
        sut?.presenter = HomePresenter()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_interacter(){
        sut?.fetchListing()
    }

}
