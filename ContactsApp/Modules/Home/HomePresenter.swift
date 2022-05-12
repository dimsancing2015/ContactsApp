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
    var view: HomeViewPresenterInterface!

}

extension HomePresenter: HomePresenterRouterInterface {

}

extension HomePresenter: HomePresenterInteractorInterface {
    func contactsList(contactsList: ContactsList){
        view.displayList(contactsList: contactsList)
    }
    
    func failFetchList(message: String) {
        view.alert(message: message)
    }
}

extension HomePresenter: HomePresenterViewInterface {

    func start() {
        if InternetConnectionManager.isConnectedToNetwork(){
            interactor.fetchListing()
        }else{
            view.alert(message: "Check Your Internet Connection!")
        }
        
    }
    
    func contactsDetail(contactDetail: Contact){
        router.goToDetail(contactDetail: contactDetail)
    }
    
    func add(){
        router.goToCreate()
    }

}
