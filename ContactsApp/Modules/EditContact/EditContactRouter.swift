//
//  EditContactRouter.swift
//  ContactsApp
//
//  Created by Dim San Cing on 5/11/22.
//

import Foundation
import UIKit

final class EditContactRouter: RouterInterface {
    weak var presenter: EditContactPresenterRouterInterface!
    weak var viewController: UIViewController?
}

extension EditContactRouter: EditContactRouterPresenterInterface {
    
}




