//
//  EditContactView.swift
//  EditContact
//
//  Created by Dim San Cing on 5/11/22.
//

import Foundation
import UIKit

final class EditContactView: UIViewController, ViewInterface {

    
    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var txtMobile: UITextField!
    @IBOutlet weak var imgProfile: UIImageView!
    
    var presenter: EditContactPresenterViewInterface!
    var contactsDetail: Datum? {
        didSet{}
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        txtMobile.isEnabled = false
        txtFirstName.text = contactsDetail?.firstName
        txtLastName.text = contactsDetail?.lastName
        txtMobile.text = String(contactsDetail!.id)
        imgProfile.image = UIImage(data: try! Data(contentsOf: URL(string: contactsDetail!.avatar )!))
    }
    @IBAction func btnDone(_ sender: Any) {
        self.presenter.saveEditContact(id: contactsDetail!.id, firstName: txtFirstName.text! , lastName: txtLastName.text!)
    }
    
    @IBAction func btnCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension EditContactView: EditContactViewPresenterInterface {
    func displayUpdateSuccess(){
        // alert
        self.dismiss(animated: true, completion: nil)
    }
    
    func displayUpdateFail(){
        // alert
    }
}
