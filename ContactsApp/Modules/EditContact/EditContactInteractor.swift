//
//  EditContactInteractor.swift
//  EditContact
//
//  Created by Dim San Cing on 5/11/22.
//

import Foundation

final class EditContactInteractor: InteractorInterface {

    weak var presenter: EditContactPresenterInteractorInterface!
    var service: NetworkManager!
    //var userRepository = UserRepository()
    
    init(service: NetworkManager) {
        self.service = service
        //self.userRepository = userRepository
    }
}

extension EditContactInteractor: EditContactInteractorPresenterInterface {

}
