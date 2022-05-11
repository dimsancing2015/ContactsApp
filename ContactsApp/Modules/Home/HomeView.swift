//
//  HomeView.swift
//  Home
//
//  Created by Dim San Cing on 5/11/22.
//

import Foundation
import UIKit

final class HomeView: UIViewController, ViewInterface {

    var presenter: HomePresenterViewInterface!


    override func viewDidLoad() {
        super.viewDidLoad()

        self.presenter.start()
    }

}

extension HomeView: HomeViewPresenterInterface {

}
