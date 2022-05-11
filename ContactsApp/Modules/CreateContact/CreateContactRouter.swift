//
//  CreateContactRouter.swift
//  ContactsApp
//
//  Created by Dim San Cing on 5/11/22.
//

import Foundation
import UIKit

final class CreateContactRouter: RouterInterface {
    weak var presenter: CreateContactPresenterRouterInterface!
    weak var viewController: UIViewController?
}

extension CreateContactRouter: CreateContactRouterPresenterInterface {
    
}




