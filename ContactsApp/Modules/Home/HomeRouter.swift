//
//  HomeRouter.swift
//  ContactsApp
//
//  Created by Dim San Cing on 5/11/22.
//

import Foundation
import UIKit

final class HomeRouter: RouterInterface {
    weak var presenter: HomePresenterRouterInterface!
    weak var viewController: UIViewController?
}

extension HomeRouter: HomeRouterPresenterInterface {
    func goToDetail(contactDetail: Datum) {
        print(" Go to Detail >>>", contactDetail)
        let view = ContactDetailModule().build(contactDetail: contactDetail)
        view.modalPresentationStyle = .fullScreen
        viewController?.present(view, animated: true)
    }
}




