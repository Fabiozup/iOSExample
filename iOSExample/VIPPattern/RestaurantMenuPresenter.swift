//
//  RestaurantMenuPresenter.swift
//  iOSExample
//
//  Created by Fabio Moreira Duarte on 12/03/24.
//

import Foundation

protocol RestaurantMenuPresenting {
    func presentMenu(response: RestaurantMenuResponse)
    func presentSwiftUIMenu(response: RestaurantMenuResponse)
}

class RestaurantMenuPresenter {
    private let coordinator: RestaurantMenuCoordinating
    weak var viewController: RestaurantMenuDisplaying?
    
    init(coordinator: RestaurantMenuCoordinating) {
        self.coordinator = coordinator
    }
}

// MARK: RESTAURANT MENU PRESENTING
extension RestaurantMenuPresenter: RestaurantMenuPresenting {
    func presentMenu(response: RestaurantMenuResponse) {
        let viewModel = RestaurantMenuViewModel(response: response)
        viewController?.displayMenu(viewModel: viewModel)
    }
    
    func presentSwiftUIMenu(response: RestaurantMenuResponse) {
        viewController?.displaySwiftUIMenu(response: response)
    }
}
