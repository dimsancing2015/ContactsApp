//
//  CreateView.swift
//  Create
//
//  Created by Dim San Cing on 5/11/22.
//

import Foundation
import UIKit

final class CreateView: UIViewController, ViewInterface {
    
    
    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var nvBar: UINavigationBar!
    var presenter: CreatePresenterViewInterface!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNvBar()
    }
    
    func configureNvBar() {
        nvBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        nvBar.shadowImage = UIImage()
    }
    
    @IBAction func btnCreate(_ sender: Any) {
        if txtFirstName.text!.isEmpty || txtLastName.text!.isEmpty {
            self.alert(message: "Enter First and Last Name")
        }else{
            self.presenter.create(firstName: txtFirstName.text!, lastName: txtLastName.text!)
        }
    }
}

extension CreateView: CreateViewPresenterInterface {
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
