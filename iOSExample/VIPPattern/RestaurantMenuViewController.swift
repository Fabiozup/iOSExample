//
//  RestaurantMenuViewController.swift
//  iOSExample
//
//  Created by Fabio Moreira Duarte on 12/03/24.
//

import UIKit
import SwiftUI

protocol RestaurantMenuDisplaying: AnyObject {
    func displayMenu(viewModel: RestaurantMenuViewModeling)
    func displaySwiftUIMenu(response: RestaurantMenuResponse)
}

class RestaurantMenuViewController: UIViewController {
    private var customView: RestaurantMenuView
    private var swiftUICustomView: RestaurantMenuSwiftUIView<RestaurantMenuSwiftUIViewModel>
    private let interactor: RestaurantMenuInteracting
    private let menuViewModel: RestaurantMenuSwiftUIViewModel
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    init(customView: RestaurantMenuView, interactor: RestaurantMenuInteracting) {
        let menuViewModel: RestaurantMenuSwiftUIViewModel = .init()
        self.menuViewModel = menuViewModel
        self.swiftUICustomView = .init(viewModel: menuViewModel)
        self.customView = customView
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Restaurante El último bocado"
//        setupView()
        setupSwiftView()
        interactor.requestMenu()
    }
}

// MARK: RESTAURANT MENU DISPLAYING
extension RestaurantMenuViewController: RestaurantMenuDisplaying {
    func displayMenu(viewModel: RestaurantMenuViewModeling) {
        customView.setUp(viewModel: viewModel)
    }
    
    func displaySwiftUIMenu(response: RestaurantMenuResponse) {
        menuViewModel.setup(response: response)
    }
}

extension RestaurantMenuViewController {
    private func setupView() {
        view.addSubview(customView)
        customView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            customView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            customView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            customView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            customView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension RestaurantMenuViewController {
    private func setupSwiftView() {
        let hostingController = UIHostingController(rootView: swiftUICustomView)
        
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.didMove(toParent: self)
        
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
