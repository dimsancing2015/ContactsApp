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
    func updateContact(message: String)
}

protocol EditContactPresenterViewInterface: PresenterViewInterface {
    func saveEditContact(id: Int, firstName: String, lastName: String)
}

// MARK: - interactor

protocol EditContactInteractorPresenterInterface: InteractorPresenterInterface {
    func updateContact(id: Int, firstName: String, lastName: String)
}

// MARK: - view

protocol EditContactViewPresenterInterface: ViewPresenterInterface {

    func displayUpdateContact(message: String)
}


// MARK: - name builder

final class EditContactModule: ModuleInterface {

    typealias View = EditContactView
    typealias Presenter = EditContactPresenter
    typealias Router = EditContactRouter
    typealias Interactor = EditContactInteractor

    func build(contactsDetail: Datum) -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let contactsRepository = ContactsRepository()
        let view = storyboard.instantiateViewController(withIdentifier: "EditContactView") as! EditContactView
        view.contactsDetail = contactsDetail
        let service = NetworkManager()
        let interactor = Interactor(service: service, contactsRepository: contactsRepository)
        let presenter = Presenter()
        let router = Router()

        self.assemble(view: view, presenter: presenter, router: router, interactor: interactor)

        router.viewController = view

        return view
    }
}
