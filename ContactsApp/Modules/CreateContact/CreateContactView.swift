//
//  CreateContactView.swift
//  CreateContact
//
//  Created by Dim San Cing on 5/11/22.
//

import Foundation
import UIKit

final class CreateContactView: UIViewController, ViewInterface {

    
    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    var presenter: CreateContactPresenterViewInterface!


    override func viewDidLoad() {
        super.viewDidLoad()

        //self.presenter.start()
    }

    @IBAction func btnCreate(_ sender: Any) {
        self.presenter.createContact(firstName: txtFirstName.text!, lastName: txtLastName.text!)
    }
}

extension CreateContactView: CreateContactViewPresenterInterface {
    func doneCreate(){
        self.dismiss(animated: true, completion: nil)
    }
}
