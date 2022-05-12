//
//  HomeInteractor.swift
//  Home
//
//  Created by Dim San Cing on 5/11/22.
//

import Foundation

final class HomeInteractor: InteractorInterface {
    
    var presenter: HomePresenterInteractorInterface!
    var service: NetworkManager!
    
    init(service: NetworkManager) {
        self.service = service
    }
}

extension HomeInteractor: HomeInteractorPresenterInterface {
    func fetchListing(){
        service.getList() {[weak self] result in
            switch result {
            case .success(let data):
                self?.presenter.contactsList(contactsList: data!)
            case .failure(let error):
                print(" Error contacts listing >>>", error)
                self?.presenter.failFetchList(message: "Failed Contacts Listing")
            }
        }
    }
}
