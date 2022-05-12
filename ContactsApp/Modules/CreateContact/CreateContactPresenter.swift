//
//  CreateContactPresenter.swift
//  CreateContact
//
//  Created by Dim San Cing on 5/11/22.
//

import Foundation

final class CreateContactPresenter: PresenterInterface {
    
    var router: CreateContactRouterPresenterInterface!
    var interactor: CreateContactInteractorPresenterInterface!
    weak var view: CreateContactViewPresenterInterface!
    
}

extension CreateContactPresenter: CreateContactPresenterRouterInterface {
    
}

extension CreateContactPresenter: CreateContactPresenterInteractorInterface {
    
    func doneCreate(message: String){
        view.doneCreate(message: message)
    }
}

extension CreateContactPresenter: CreateContactPresenterViewInterface {
    
    func createContact(firstName: String, lastName: String) {
        interactor?.createContact(firstName: firstName, lastName: lastName)
    }
    
    
    
}
