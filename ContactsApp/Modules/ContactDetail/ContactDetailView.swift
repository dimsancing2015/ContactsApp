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

    @IBOutlet weak var btnEdit: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.presenter.start()
    }
    @IBAction func btnEdit(_ sender: Any) {
        presenter.goToEdit()
    }
    

}

extension ContactDetailView: ContactDetailViewPresenterInterface {

}
