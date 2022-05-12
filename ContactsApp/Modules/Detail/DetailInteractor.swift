//
//  DetailInteractor.swift
//  Detail
//
//  Created by Dim San Cing on 5/11/22.
//

import Foundation

final class DetailInteractor: InteractorInterface {
    
    weak var presenter: DetailPresenterInteractorInterface!
    var service: NetworkManager!
    
    init(service: NetworkManager) {
        self.service = service
    }
}

extension DetailInteractor: DetailInteractorPresenterInterface {
    
}
