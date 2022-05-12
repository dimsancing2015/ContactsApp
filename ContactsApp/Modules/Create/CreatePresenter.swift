//
//  CreatePresenter.swift
//  Create
//
//  Created by Dim San Cing on 5/11/22.
//

import Foundation

final class CreatePresenter: PresenterInterface {
    
    var router: CreateRouterPresenterInterface!
    var interactor: CreateInteractorPresenterInterface!
    weak var view: CreateViewPresenterInterface!
    
}

extension CreatePresenter: CreatePresenterRouterInterface {
    
}

extension CreatePresenter: CreatePresenterInteractorInterface {
    
    func doneCreate(message: String){
        view.doneCreate(message: message)
    }
    
}

extension CreatePresenter: CreatePresenterViewInterface {
    
    func create(firstName: String, lastName: String) {
        interactor?.create(firstName: firstName, lastName: lastName)
    }
    
}
