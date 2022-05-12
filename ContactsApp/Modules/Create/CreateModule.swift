//
//  CreateModule.swift
//  Create
//
//  Created by Dim San Cing on 5/11/22.
//
import Foundation
import UIKit

// MARK: - router

protocol CreateRouterPresenterInterface: RouterPresenterInterface {
    
}

// MARK: - presenter

protocol CreatePresenterRouterInterface: PresenterRouterInterface {
    
}

protocol CreatePresenterInteractorInterface: PresenterInteractorInterface {
    func doneCreate(message: String)
}

protocol CreatePresenterViewInterface: PresenterViewInterface {
    func create(firstName: String, lastName: String)
}

// MARK: - interactor

protocol CreateInteractorPresenterInterface: InteractorPresenterInterface {
    func create(firstName: String, lastName: String)
    
}

// MARK: - view

protocol CreateViewPresenterInterface: ViewPresenterInterface {
    func doneCreate(message: String)
}


// MARK: - name builder

class CreateModule: ModuleInterface {
    
    typealias View = CreateView
    typealias Presenter = CreatePresenter
    typealias Router = CreateRouter
    typealias Interactor = CreateInteractor
    
    func build() -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let contactsRepository = ContactsRepository()
        let view = storyboard.instantiateViewController(withIdentifier: "CreateView") as! CreateView
        let service = NetworkManager()
        let interactor = Interactor(service: service, contactsRepository: contactsRepository)
        let presenter = Presenter()
        let router = Router()
        
        self.assemble(view: view, presenter: presenter, router: router, interactor: interactor)
        
        router.viewController = view
        
        return view
    }
}
