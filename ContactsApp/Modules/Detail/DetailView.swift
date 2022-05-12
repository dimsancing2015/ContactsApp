//
//  DetailView.swift
//  Detail
//
//  Created by Dim San Cing on 5/11/22.
//

import Foundation
import UIKit

final class DetailView: UIViewController, ViewInterface {
    
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var nvBar: UINavigationBar!
    
    var presenter: DetailPresenterViewInterface!
    var contactsDetail: Contact? {
        didSet {}
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNvBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        lbName.text = String(contactsDetail!.firstName) + String(contactsDetail!.lastName)
        imgProfile.image = UIImage(data: try! Data(contentsOf: URL(string: contactsDetail!.avatar )!))
        imgProfile.layer.masksToBounds = true
        imgProfile.layer.cornerRadius = 50
        
    }
    
    func configureNvBar()
    {
        nvBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        nvBar.shadowImage = UIImage()
    }
    
    @IBAction func btnEdit(_ sender: Any) {
        presenter.goToEdit(contactsDetail: contactsDetail!)
    }
    
    @IBAction func btnBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}

extension DetailView: DetailViewPresenterInterface {
    
}
