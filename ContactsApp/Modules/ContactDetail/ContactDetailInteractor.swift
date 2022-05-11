//
//  ContactDetailInteractor.swift
//  ContactDetail
//
//  Created by Dim San Cing on 5/11/22.
//

import Foundation

final class ContactDetailInteractor: InteractorInterface {

    weak var presenter: ContactDetailPresenterInteractorInterface!
    var service: NetworkManager!
    //var userRepository = UserRepository()
    
    init(service: NetworkManager) {
        self.service = service
        //self.userRepository = userRepository
    }
}

extension ContactDetailInteractor: ContactDetailInteractorPresenterInterface {

}
