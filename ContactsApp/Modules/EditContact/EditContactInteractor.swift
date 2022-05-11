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
    func updateContact(id: Int, firstName: String, lastName: String){
        service.updateContact(id: id, firstName: firstName, lastName: lastName){[weak self] result in
            switch result {
            case .success(let data):
                print("update successful >>>", data)
                self!.presenter.updateSuccess()
            case .failure(let error):
                print("update fial >>>", error)
                self!.presenter.updateFail()
            }
            
        }
    }
}
