//
//  CreateContactInteractor.swift
//  CreateContact
//
//  Created by Dim San Cing on 5/11/22.
//

import Foundation

final class CreateContactInteractor: InteractorInterface {

    weak var presenter: CreateContactPresenterInteractorInterface!
    var service: NetworkManager!
    var contactsRepository = ContactsRepository()
    
    init(service: NetworkManager, contactsRepository: ContactsRepository) {
        self.service = service
        self.contactsRepository = contactsRepository
    }
}

extension CreateContactInteractor: CreateContactInteractorPresenterInterface {
    func createContact(firstName: String, lastName: String){
        contactsRepository.create(firstName: firstName, lastName: lastName)
    }
}
