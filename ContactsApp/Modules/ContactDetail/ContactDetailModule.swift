//
//  ContactDetailModule.swift
//  ContactDetail
//
//  Created by Dim San Cing on 5/11/22.
//
import Foundation
import UIKit

// MARK: - router

protocol ContactDetailRouterPresenterInterface: RouterPresenterInterface {

}

// MARK: - presenter

protocol ContactDetailPresenterRouterInterface: PresenterRouterInterface {

}

protocol ContactDetailPresenterInteractorInterface: PresenterInteractorInterface {

}

protocol ContactDetailPresenterViewInterface: PresenterViewInterface {
    func start()
}

// MARK: - interactor

protocol ContactDetailInteractorPresenterInterface: InteractorPresenterInterface {

}

// MARK: - view

protocol ContactDetailViewPresenterInterface: ViewPresenterInterface {

}


// MARK: - name builder

final class ContactDetailname: ModuleInterface {

    typealias View = ContactDetailView
    typealias Presenter = ContactDetailPresenter
    typealias Router = ContactDetailRouter
    typealias Interactor = ContactDetailInteractor

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
