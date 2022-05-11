//
//  HomeCell.swift
//  ContactsApp
//
//  Created by Dim San Cing on 5/11/22.
//

import Foundation
import UIKit

class HomeCell: UITableViewCell {
    
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    
    var contacts: Datum! {
        didSet {
            lbName.text = contacts.firstName + contacts.lastName
            imgProfile.image = UIImage(data: try! Data(contentsOf: URL(string: contacts.avatar )!))
            imgProfile.layer.masksToBounds = true
            imgProfile.layer.cornerRadius = 40
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
