//
//  RestaurantMenuViewController.swift
//  iOSExample
//
//  Created by Fabio Moreira Duarte on 12/03/24.
//

import UIKit

protocol RestaurantMenuDisplaying: AnyObject {
    func displayMenu(viewModel: RestaurantMenuViewModeling)
}

class RestaurantMenuViewController: UIViewController {
    private var customView: RestaurantMenuView
    private let interactor: RestaurantMenuInteracting
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    init(customView: RestaurantMenuView, interactor: RestaurantMenuInteracting) {
        self.customView = customView
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "RESTAURANTE LA LENDA"
        view = customView
        interactor.requestMenu()
    }
}

// MARK: RESTAURANT MENU DISPLAYING
extension RestaurantMenuViewController: RestaurantMenuDisplaying {
    func displayMenu(viewModel: RestaurantMenuViewModeling) {
        customView.setUp(viewModel: viewModel)
    }
}
