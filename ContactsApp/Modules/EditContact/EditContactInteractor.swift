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
    var contactsRepository = ContactsRepository()
    
    init(service: NetworkManager, contactsRepository: ContactsRepository) {
        self.service = service
        self.contactsRepository = contactsRepository
    }
}

extension EditContactInteractor: EditContactInteractorPresenterInterface {
    func updateContact(id: Int, firstName: String, lastName: String){
        service.updateContact(id: id, firstName: firstName, lastName: lastName){[weak self] result in
            switch result {
            case .success( _):
                self!.updateLocalStorage(id: id, firstName: firstName, lastName: lastName)
                self!.presenter.updateContact(message: "Updated Contact Information")
            case .failure(let error):
                print("update fial >>>", error)
                self!.presenter.updateContact(message: "Failed Contact Information")
            }
            
        }
    }
    
    private func updateLocalStorage(id: Int, firstName: String, lastName: String) {
        let contacts = contactsRepository.findUser(id: id)
        if contacts!.id != nil {
            contactsRepository.update(id: id, firstName: firstName, lastName: lastName)
        }
        
    }
}
