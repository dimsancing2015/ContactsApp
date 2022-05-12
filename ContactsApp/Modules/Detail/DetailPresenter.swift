//
//  DetailPresenter.swift
//  Detail
//
//  Created by Dim San Cing on 5/11/22.
//

import Foundation

final class DetailPresenter: PresenterInterface {

    var router: DetailRouterPresenterInterface!
    var interactor: DetailInteractorPresenterInterface!
    weak var view: DetailViewPresenterInterface!

}

extension DetailPresenter: DetailPresenterRouterInterface {

}

extension DetailPresenter: DetailPresenterInteractorInterface {

}

extension DetailPresenter: DetailPresenterViewInterface {
    
    func goToEdit(contactsDetail: Contact) {
        router.goToEdit(contactsDetail: contactsDetail)
    }

}
