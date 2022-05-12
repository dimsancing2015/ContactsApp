//
//  DetailModule.swift
//  Detail
//
//  Created by Dim San Cing on 5/11/22.
//
import Foundation
import UIKit

// MARK: - router

protocol DetailRouterPresenterInterface: RouterPresenterInterface {
    func goToEdit(contactsDetail: Contact)
}

// MARK: - presenter

protocol DetailPresenterRouterInterface: PresenterRouterInterface {
    
}

protocol DetailPresenterInteractorInterface: PresenterInteractorInterface {
    
}

protocol DetailPresenterViewInterface: PresenterViewInterface {
    func goToEdit(contactsDetail: Contact)
}

// MARK: - interactor

protocol DetailInteractorPresenterInterface: InteractorPresenterInterface {
    
}

// MARK: - view

protocol DetailViewPresenterInterface: ViewPresenterInterface {
    
}


// MARK: - name builder

class DetailModule: ModuleInterface {
    
    typealias View = DetailView
    typealias Presenter = DetailPresenter
    typealias Router = DetailRouter
    typealias Interactor = DetailInteractor
    
    func build(contactDetail: Contact) -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "DetailView") as! DetailView
        view.contactsDetail = contactDetail
        let service = NetworkManager()
        let interactor = Interactor(service: service)
        let presenter = Presenter()
        let router = Router()
        
        self.assemble(view: view, presenter: presenter, router: router, interactor: interactor)
        
        router.viewController = view
        
        return view
    }
}
