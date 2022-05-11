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
    func goToEdit(contactsDetail: Datum)
}

// MARK: - presenter

protocol ContactDetailPresenterRouterInterface: PresenterRouterInterface {

}

protocol ContactDetailPresenterInteractorInterface: PresenterInteractorInterface {

}

protocol ContactDetailPresenterViewInterface: PresenterViewInterface {
    func start()
    func goToEdit(contactsDetail: Datum)
}

// MARK: - interactor

protocol ContactDetailInteractorPresenterInterface: InteractorPresenterInterface {

}

// MARK: - view

protocol ContactDetailViewPresenterInterface: ViewPresenterInterface {

}


// MARK: - name builder

final class ContactDetailModule: ModuleInterface {

    typealias View = ContactDetailView
    typealias Presenter = ContactDetailPresenter
    typealias Router = ContactDetailRouter
    typealias Interactor = ContactDetailInteractor

    func build(contactDetail: Datum) -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        //let userRepository = UserRepository()
        let view = storyboard.instantiateViewController(withIdentifier: "ContactDetailView") as! ContactDetailView
        view.contactsDetail = contactDetail
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
