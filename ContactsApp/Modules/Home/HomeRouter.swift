//
//  HomeRouter.swift
//  ContactsApp
//
//  Created by Dim San Cing on 5/11/22.
//

import Foundation
import UIKit

class HomeRouter: RouterInterface {
    weak var presenter: HomePresenterRouterInterface!
    weak var viewController: UIViewController?
}

extension HomeRouter: HomeRouterPresenterInterface {
    func goToDetail(contactDetail: Contact) {
        let view = DetailModule().build(contactDetail: contactDetail)
        view.modalPresentationStyle = .fullScreen
        viewController?.present(view, animated: true)
    }
    
    func goToCreate(){
        let view = CreateModule().build()
        view.modalPresentationStyle = .fullScreen
        viewController?.present(view, animated: true)
    }
}




