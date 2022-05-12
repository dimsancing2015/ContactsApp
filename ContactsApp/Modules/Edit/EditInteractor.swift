//
//  EditInteractor.swift
//  Edit
//
//  Created by Dim San Cing on 5/11/22.
//

import Foundation

final class EditInteractor: InteractorInterface {
    
    var presenter: EditPresenterInteractorInterface!
    var service: NetworkManager!
    var contactsRepository = ContactsRepository()
    
    init(service: NetworkManager, contactsRepository: ContactsRepository) {
        self.service = service
        self.contactsRepository = contactsRepository
    }
}

extension EditInteractor: EditInteractorPresenterInterface {
    func update(id: Int, firstName: String, lastName: String){
        service.update(id: id, firstName: firstName, lastName: lastName){[weak self] result in
            switch result {
            case .success( _):
                self!.updateLocalStorage(id: id, firstName: firstName, lastName: lastName)
                self!.presenter.update(message: "Updated Contact Information")
            case .failure(let error):
                print("update fial >>>", error)
                self!.presenter.update(message: "Failed Contact Information")
            }
            
        }
    }
    
    private func updateLocalStorage(id: Int, firstName: String, lastName: String) {
        let contacts = contactsRepository.find(id: id)
        if contacts != nil {
            contactsRepository.update(id: id, firstName: firstName, lastName: lastName)
        }
        
    }
}
