//
//  DetailRouter.swift
//  ContactsApp
//
//  Created by Dim San Cing on 5/11/22.
//

import Foundation
import UIKit

class DetailRouter: RouterInterface {
    weak var presenter: DetailPresenterRouterInterface!
    weak var viewController: UIViewController?
}

extension DetailRouter: DetailRouterPresenterInterface {
    func goToEdit(contactsDetail: Contact) {
        let view = EditModule().build(contactsDetail: contactsDetail)
        view.modalPresentationStyle = .fullScreen
        viewController?.present(view, animated: true)
    }
}



