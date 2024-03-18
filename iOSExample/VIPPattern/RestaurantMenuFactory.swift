//
//  RestaurantMenuFactory.swift
//  iOSExample
//
//  Created by Fabio Moreira Duarte on 12/03/24.
//

import UIKit

enum RestaurantMenuFactory {
    static func configure() -> UIViewController {
        let worker = RestaurantMenuWorker()
        let coordinator = RestaurantMenuCoordinator()
        let customView = RestaurantMenuView()
        let presenter = RestaurantMenuPresenter(coordinator: coordinator)
        let interactor = RestaurantMenuInteractor(presenter: presenter, worker: worker)
        let controller =  RestaurantMenuViewController(customView: customView, interactor: interactor)
        presenter.viewController = controller
        coordinator.viewController = controller
        return controller
    }
}
