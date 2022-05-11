//
//  EditContactPresenter.swift
//  EditContact
//
//  Created by Dim San Cing on 5/11/22.
//

import Foundation

final class EditContactPresenter: PresenterInterface {

    var router: EditContactRouterPresenterInterface!
    var interactor: EditContactInteractorPresenterInterface!
    weak var view: EditContactViewPresenterInterface!

}

extension EditContactPresenter: EditContactPresenterRouterInterface {

}

extension EditContactPresenter: EditContactPresenterInteractorInterface {

}

extension EditContactPresenter: EditContactPresenterViewInterface {

    func start() {

    }

}
