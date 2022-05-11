//
//  ContactDetailPresenter.swift
//  ContactDetail
//
//  Created by Dim San Cing on 5/11/22.
//

import Foundation

final class ContactDetailPresenter: PresenterInterface {

    var router: ContactDetailRouterPresenterInterface!
    var interactor: ContactDetailInteractorPresenterInterface!
    weak var view: ContactDetailViewPresenterInterface!

}

extension ContactDetailPresenter: ContactDetailPresenterRouterInterface {

}

extension ContactDetailPresenter: ContactDetailPresenterInteractorInterface {

}

extension ContactDetailPresenter: ContactDetailPresenterViewInterface {
    
    func goToEdit(contactsDetail: Datum) {
        router.goToEdit(contactsDetail: contactsDetail)
    }

}
