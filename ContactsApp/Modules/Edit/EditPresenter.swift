//
//  EditPresenter.swift
//  EditContact
//
//  Created by Dim San Cing on 5/11/22.
//

import Foundation

final class EditPresenter: PresenterInterface {
    
    var router: EditRouterPresenterInterface!
    var interactor: EditInteractorPresenterInterface!
    weak var view: EditViewPresenterInterface!
    
}

extension EditPresenter: EditPresenterRouterInterface {
    
}

extension EditPresenter: EditPresenterInteractorInterface {
    func update(message: String){
        view.displayUpdate(message: message)
    }
    
}

extension EditPresenter: EditPresenterViewInterface {
    func saveEdit(id: Int, firstName: String, lastName: String) {
        interactor?.update(id: id, firstName: firstName, lastName: lastName)
    }
    
}
