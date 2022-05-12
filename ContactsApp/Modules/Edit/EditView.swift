//
//  EditView.swift
//  Edit
//
//  Created by Dim San Cing on 5/11/22.
//

import Foundation
import UIKit

final class EditView: UIViewController, ViewInterface {
    
    
    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var txtMobile: UITextField!
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var nvBar: UINavigationBar!
    
    var presenter: EditPresenterViewInterface!
    var contactsDetail: Contact? {
        didSet{}
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNvBar()
    }
    
    func configureNvBar() {
        nvBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        nvBar.shadowImage = UIImage()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        txtMobile.isEnabled = false
        txtFirstName.text = contactsDetail?.firstName
        txtLastName.text = contactsDetail?.lastName
        txtMobile.text = String(contactsDetail!.id)
        imgProfile.image = UIImage(data: try! Data(contentsOf: URL(string: contactsDetail!.avatar )!))
        imgProfile.layer.masksToBounds = true
        imgProfile.layer.cornerRadius = 50
    }
    
    @IBAction func btnDone(_ sender: Any) {
        self.presenter.saveEdit(id: contactsDetail!.id, firstName: txtFirstName.text! , lastName: txtLastName.text!)
    }
    
    @IBAction func btnCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension EditView: EditViewPresenterInterface {
    func displayUpdate(message: String){
        let alert = UIAlertController(title: "ContactsApp", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { action in
            self.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
