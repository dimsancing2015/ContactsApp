//
//  HomePresenter.swift
//  Home
//
//  Created by Dim San Cing on 5/11/22.
//

import Foundation

final class HomePresenter: PresenterInterface {

    var router: HomeRouterPresenterInterface!
    var interactor: HomeInteractorPresenterInterface!
    weak var view: HomeViewPresenterInterface!

}

extension HomePresenter: HomePresenterRouterInterface {

}

extension HomePresenter: HomePresenterInteractorInterface {
    func contactsList(contactsList: ContactsList){
        view.displayContactsList(contactsList: contactsList)
    }
}

extension HomePresenter: HomePresenterViewInterface {

    func start() {
        interactor.fetchContactsListing()
    }
    
    func contactsDetail(contactDetail: Datum){
        router.goToDetail(contactDetail: contactDetail)
    }
    
    func addContact(){
        router.goToCreateContact()
    }

}
