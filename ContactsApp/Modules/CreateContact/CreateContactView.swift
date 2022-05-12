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
        
    }
    
    @IBAction func btnCreate(_ sender: Any) {
        if txtFirstName.text!.isEmpty || txtLastName.text!.isEmpty {
            self.alert(message: "Enter First and Last Name")
        }else{
            self.presenter.createContact(firstName: txtFirstName.text!, lastName: txtLastName.text!)
        }
    }
}

extension CreateContactView: CreateContactViewPresenterInterface {
    func doneCreate(message: String){
        let alert = UIAlertController(title: "ContactsApp", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { action in
            self.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func alert(message: String){
        let alert = UIAlertController(title: "ContactsApp", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    
}
