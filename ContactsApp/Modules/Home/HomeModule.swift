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
        let view = View()
        let interactor = Interactor()
        let presenter = Presenter()
        let router = Router()

        self.assemble(view: view, presenter: presenter, router: router, interactor: interactor)

        router.viewController = view

        return view
    }
}
