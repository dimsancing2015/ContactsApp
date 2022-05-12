//
//  EditModule.swift
//  EditContact
//
//  Created by Dim San Cing on 5/11/22.
//
import Foundation
import UIKit

// MARK: - router

protocol EditRouterPresenterInterface: RouterPresenterInterface {
    
}

// MARK: - presenter

protocol EditPresenterRouterInterface: PresenterRouterInterface {
    
}

protocol EditPresenterInteractorInterface: PresenterInteractorInterface {
    func update(message: String)
}

protocol EditPresenterViewInterface: PresenterViewInterface {
    func saveEdit(id: Int, firstName: String, lastName: String)
}

// MARK: - interactor

protocol EditInteractorPresenterInterface: InteractorPresenterInterface {
    func update(id: Int, firstName: String, lastName: String)
}

// MARK: - view

protocol EditViewPresenterInterface: ViewPresenterInterface {
    
    func displayUpdate(message: String)
}


// MARK: - name builder

class EditModule: ModuleInterface {
    
    typealias View = EditView
    typealias Presenter = EditPresenter
    typealias Router = EditRouter
    typealias Interactor = EditInteractor
    
    func build(contactsDetail: Contact) -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let contactsRepository = ContactsRepository()
        let view = storyboard.instantiateViewController(withIdentifier: "EditView") as! EditView
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
