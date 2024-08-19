//
//  RestaurantMenuInteractor.swift
//  iOSExample
//
//  Created by Fabio Moreira Duarte on 12/03/24.
//

import Foundation

protocol RestaurantMenuInteracting {
    func requestMenu()
}

class RestaurantMenuInteractor {
    private let worker: RestaurantMenuWorkerInput
    private var presenter: RestaurantMenuPresenting
    
    init(presenter: RestaurantMenuPresenting,
         worker: RestaurantMenuWorkerInput) {
        self.presenter = presenter
        self.worker = worker
    }
}

// MARK: RESTAURANT MENU INTERACTING
extension RestaurantMenuInteractor: RestaurantMenuInteracting {
    func requestMenu() {
        worker.requestMenu { [weak self] response in
//            self?.presenter.presentMenu(response: response)
            self?.presenter.presentSwiftUIMenu(response: response)
        }
    }
}
