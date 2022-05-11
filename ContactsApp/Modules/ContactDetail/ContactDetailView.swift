//
//  ContactDetailView.swift
//  ContactDetail
//
//  Created by Dim San Cing on 5/11/22.
//

import Foundation
import UIKit

final class ContactDetailView: UIViewController, ViewInterface {
    
    @IBOutlet weak var imgProfile: UIImageView!
    //    @IBOutlet weak var txtMobile: UITextField!
    //    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var btnEdit: UIButton!
    
    var presenter: ContactDetailPresenterViewInterface!
    var contactsDetail: Datum? {
        didSet {}
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        lbName.text = String(contactsDetail!.firstName) + String(contactsDetail!.lastName)
        //        txtEmail.text = contactsDetail?.email
        //        txtMobile.text = String(contactsDetail!.id)
        imgProfile.image = UIImage(data: try! Data(contentsOf: URL(string: contactsDetail!.avatar )!))
        imgProfile.layer.masksToBounds = true
        imgProfile.layer.cornerRadius = 50
        
    }
    
    @IBAction func btnEdit(_ sender: Any) {
        presenter.goToEdit(contactsDetail: contactsDetail!)
    }
    
    @IBAction func btnBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}

extension ContactDetailView: ContactDetailViewPresenterInterface {
    
}
