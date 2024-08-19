//
//  RestaurantMenuSwiftUIViewController.swift
//  iOSExample
//
//  Created by Fabio Moreira Duarte on 22/07/24.
//

import UIKit
import SwiftUI

class RestaurantMenuSwiftUIViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let contentView = RestaurantMenuSwiftUIView(viewModel: RestaurantMenuSwiftUIViewModel())
        let hostingController = UIHostingController(rootView: contentView)
        
        // Add the hosting controller as a child view controller
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.didMove(toParent: self)
        
        // Set constraints to make the SwiftUI view fill the entire screen
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
