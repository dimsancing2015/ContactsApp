//
//  CreateInteractor.swift
//  Create
//
//  Created by Dim San Cing on 5/11/22.
//

import Foundation

final class CreateInteractor: InteractorInterface {
    
    var presenter: CreatePresenterInteractorInterface!
    var service: NetworkManager!
    var contactsRepository = ContactsRepository()
    
    init(service: NetworkManager, contactsRepository: ContactsRepository) {
        self.service = service
        self.contactsRepository = contactsRepository
    }
}

extension CreateInteractor: CreateInteractorPresenterInterface {
    
    func create(firstName: String, lastName: String){
        service.create(firstName: firstName, lastName: lastName){[weak self] result in
            switch result {
            case .success(let data):
                self!.contactsRepository.create(id: Int(data!.id)!, firstName: firstName, lastName: lastName)
                self!.presenter.doneCreate(message: "Created New Contact")
            case .failure(let error):
                print(" Create Failed >>>", error)
                self!.presenter.doneCreate(message: "Failed New Contact")
            }
        }
    }
}
