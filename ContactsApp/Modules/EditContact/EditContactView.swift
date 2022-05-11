//
//  EditContactView.swift
//  EditContact
//
//  Created by Dim San Cing on 5/11/22.
//

import Foundation
import UIKit

final class EditContactView: UIViewController, ViewInterface {

    var presenter: EditContactPresenterViewInterface!


    override func viewDidLoad() {
        super.viewDidLoad()

        self.presenter.start()
    }

}

extension EditContactView: EditContactViewPresenterInterface {

}
