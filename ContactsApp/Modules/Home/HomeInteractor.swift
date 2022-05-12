//
//  HomeInteractor.swift
//  Home
//
//  Created by Dim San Cing on 5/11/22.
//

import Foundation
import RxSwift
import Moya

final class HomeInteractor: InteractorInterface {
    
    var presenter: HomePresenterInteractorInterface!
    var service: NetworkManager!
    //var contactsRepository = ContactsRepository()
    
    init(service: NetworkManager) {
        self.service = service
        //self.contactsRepository = contactsRepository
    }
}

extension HomeInteractor: HomeInteractorPresenterInterface {
    func fetchContactsListing(){
        service.getContactsList() {[weak self] result in
            switch result {
            case .success(let data):
                self?.presenter.contactsList(contactsList: data!)
            case .failure(let error):
                print(" Error contacts listing >>>", error)
                self?.presenter.failFetchContactsList(message: "Failed Contacts Listing")
            }
        }
    }
}
