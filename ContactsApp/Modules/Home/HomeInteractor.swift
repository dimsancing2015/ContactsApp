//
//  HomeInteractor.swift
//  Home
//
//  Created by Dim San Cing on 5/11/22.
//

import Foundation

final class HomeInteractor: InteractorInterface {

    weak var presenter: HomePresenterInteractorInterface!
}

extension HomeInteractor: HomeInteractorPresenterInterface {

}
