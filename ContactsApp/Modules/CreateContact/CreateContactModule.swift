//
//  CreateContactModule.swift
//  CreateContact
//
//  Created by Dim San Cing on 5/11/22.
//
import Foundation
import UIKit

// MARK: - router

protocol CreateContactRouterPresenterInterface: RouterPresenterInterface {
    
}

// MARK: - presenter

protocol CreateContactPresenterRouterInterface: PresenterRouterInterface {
    
}

protocol CreateContactPresenterInteractorInterface: PresenterInteractorInterface {
    func doneCreate(message: String)
}

protocol CreateContactPresenterViewInterface: PresenterViewInterface {
    func createContact(firstName: String, lastName: String)
}

// MARK: - interactor

protocol CreateContactInteractorPresenterInterface: InteractorPresenterInterface {
    func createContact(firstName: String, lastName: String)
    
}

// MARK: - view

protocol CreateContactViewPresenterInterface: ViewPresenterInterface {
    func doneCreate(message: String)
}


// MARK: - name builder

class CreateContactModule: ModuleInterface {
    
    typealias View = CreateContactView
    typealias Presenter = CreateContactPresenter
    typealias Router = CreateContactRouter
    typealias Interactor = CreateContactInteractor
    
    func build() -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let contactsRepository = ContactsRepository()
        let view = storyboard.instantiateViewController(withIdentifier: "CreateContactView") as! CreateContactView
        let service = NetworkManager()
        let interactor = Interactor(service: service, contactsRepository: contactsRepository)
        let presenter = Presenter()
        let router = Router()
        
        self.assemble(view: view, presenter: presenter, router: router, interactor: interactor)
        
        router.viewController = view
        
        return view
    }
}
