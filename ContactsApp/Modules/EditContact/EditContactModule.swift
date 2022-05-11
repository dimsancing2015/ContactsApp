//
//  EditContactModule.swift
//  EditContact
//
//  Created by Dim San Cing on 5/11/22.
//
import Foundation
import UIKit

// MARK: - router

protocol EditContactRouterPresenterInterface: RouterPresenterInterface {

}

// MARK: - presenter

protocol EditContactPresenterRouterInterface: PresenterRouterInterface {

}

protocol EditContactPresenterInteractorInterface: PresenterInteractorInterface {

}

protocol EditContactPresenterViewInterface: PresenterViewInterface {
    func start()
}

// MARK: - interactor

protocol EditContactInteractorPresenterInterface: InteractorPresenterInterface {

}

// MARK: - view

protocol EditContactViewPresenterInterface: ViewPresenterInterface {

}


// MARK: - name builder

final class EditContactname: ModuleInterface {

    typealias View = EditContactView
    typealias Presenter = EditContactPresenter
    typealias Router = EditContactRouter
    typealias Interactor = EditContactInteractor

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
