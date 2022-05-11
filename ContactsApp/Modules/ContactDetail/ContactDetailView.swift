//
//  ContactDetailView.swift
//  ContactDetail
//
//  Created by Dim San Cing on 5/11/22.
//

import Foundation
import UIKit

final class ContactDetailView: UIViewController, ViewInterface {

    var presenter: ContactDetailPresenterViewInterface!


    override func viewDidLoad() {
        super.viewDidLoad()

        self.presenter.start()
    }

}

extension ContactDetailView: ContactDetailViewPresenterInterface {

}
