//
//  ContactDetailRouter.swift
//  ContactsApp
//
//  Created by Dim San Cing on 5/11/22.
//

import Foundation
import UIKit

final class ContactDetailRouter: RouterInterface {
    weak var presenter: ContactDetailPresenterRouterInterface!
    weak var viewController: UIViewController?
}

extension ContactDetailRouter: ContactDetailRouterPresenterInterface {
    func goToEdit() {
        print(" Go to Edit Contact >>>")
        let view = EditContactModule().build()
        view.modalPresentationStyle = .fullScreen
        viewController?.present(view, animated: true)
    }
    
    
}



