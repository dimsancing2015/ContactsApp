//
//  HomeView.swift
//  Home
//
//  Created by Dim San Cing on 5/11/22.
//

import Foundation
import UIKit

final class HomeView: UIViewController, ViewInterface, UITableViewDelegate, UITableViewDataSource {

    var presenter: HomePresenterViewInterface!
    @IBOutlet weak var tbView: UITableView!
    
    var contactsListing : ContactsList? {
        didSet {
            if contactsListing?.data != nil {
                tbView.reloadData()
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tbView.register(UINib(nibName: "HomeCell", bundle: nil), forCellReuseIdentifier: "HomeCell")
        tbView.delegate = self
        tbView.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if presenter != nil {
            self.presenter.start()
        }
    }
    
    @IBAction func btnAdd(_ sender: Any) {
        self.presenter.addContact()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(" listing value >>>", contactsListing?.data.count)
        if contactsListing?.data.count == 0 || contactsListing?.data == nil {
            return 0
        }
        return (contactsListing?.data.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath) as! HomeCell
        cell.contacts = contactsListing?.data[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.presenter.contactsDetail(contactDetail: (contactsListing?.data[indexPath.row])!)
    }

}

extension HomeView: HomeViewPresenterInterface{
    
    
    func displayContactsList(contactsList: ContactsList){
        print( "HOme view contactList >>>>", contactsList.data.count)
        contactsListing = contactsList
    }
}
