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

}

// MARK: - presenter

protocol HomePresenterRouterInterface: PresenterRouterInterface {

}

protocol HomePresenterInteractorInterface: PresenterInteractorInterface {

}

protocol HomePresenterViewInterface: PresenterViewInterface {
    func start()
}

// MARK: - interactor

protocol HomeInteractorPresenterInterface: InteractorPresenterInterface {
    func fetchContactsListing()
}

// MARK: - view

protocol HomeViewPresenterInterface: ViewPresenterInterface {

}


// MARK: - name builder

final class HomeModule: ModuleInterface {

    typealias View = HomeView
    typealias Presenter = HomePresenter
    typealias Router = HomeRouter
    typealias Interactor = HomeInteractor

    func build() -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        //let userRepository = UserRepository()
        let view = storyboard.instantiateViewController(withIdentifier: "HomeView") as! HomeView
        let service = NetworkManager()
       // let interactor = Interactor(service: service, userRepository: userRepository)
        let interactor = Interactor(service: service)
        let presenter = Presenter()
        let router = Router()

        self.assemble(view: view, presenter: presenter, router: router, interactor: interactor)

        router.viewController = view

        return view
    }
}
