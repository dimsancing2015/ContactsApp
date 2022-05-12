//
//  HomeModule.swift
//  Home
//
//  Created by Dim San Cing on 5/11/22.
//
import Foundation
import UIKit

// MARK: - router

protocol HomeRouterPresenterInterface: RouterPresenterInterface {
    func  goToDetail(contactDetail: Contact)
    func goToCreate()
}

// MARK: - presenter

protocol HomePresenterRouterInterface: PresenterRouterInterface {

}

protocol HomePresenterInteractorInterface: PresenterInteractorInterface {
    func contactsList(contactsList: ContactsList)
    func failFetchList(message: String)
}

protocol HomePresenterViewInterface: PresenterViewInterface {
    func start()
    func contactsDetail(contactDetail: Contact)
    func add()
}

// MARK: - interactor

protocol HomeInteractorPresenterInterface: InteractorPresenterInterface {
    func fetchListing()
}

// MARK: - view

protocol HomeViewPresenterInterface: ViewPresenterInterface {
    func displayList(contactsList: ContactsList)
    func alert(message: String)
}


// MARK: - name builder

class HomeModule: ModuleInterface {

    typealias View = HomeView
    typealias Presenter = HomePresenter
    typealias Router = HomeRouter
    typealias Interactor = HomeInteractor

    func build() -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "HomeView") as! HomeView
        let service = NetworkManager()
        let interactor = Interactor(service: service)
        let presenter = Presenter()
        let router = Router()

        self.assemble(view: view, presenter: presenter, router: router, interactor: interactor)

        router.viewController = view

        return view
    }
}
