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
    
    func failFetchContactsList(message: String) {
        view.alert(message: message)
    }
}

extension HomePresenter: HomePresenterViewInterface {

    func start() {
        if InternetConnectionManager.isConnectedToNetwork(){
            interactor.fetchContactsListing()
        }else{
            view.alert(message: "Check Your Internet Connection!")
        }
        
    }
    
    func contactsDetail(contactDetail: Datum){
        router.goToDetail(contactDetail: contactDetail)
    }
    
    func addContact(){
        router.goToCreateContact()
    }

}
