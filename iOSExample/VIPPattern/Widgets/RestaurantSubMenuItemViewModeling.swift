//
//  RestaurantSubMenuItemViewModeling.swift
//  iOSExample
//
//  Created by Fabio Moreira Duarte on 12/03/24.
//

import UIKit

protocol RestaurantSubMenuItemViewModeling {
    var name: String { get }
    var image: UIImage? { get }
    var side: RestaurantSubMenuItemViewModel.Side { get }
}

class RestaurantSubMenuItemViewModel: RestaurantSubMenuItemViewModeling {
    private(set) var name: String = .init()
    private(set) var image: UIImage?
    private(set) var side: Side = .left
    
    init(item: RestauranteSubMenuItem, side: Side) {
        self.name = item.name ?? .init()
        self.image = UIImage(named: item.imageName ?? .init())
        self.side = side
    }
}

extension RestaurantSubMenuItemViewModel {
    enum Side {
        case left
        case right
    }
}
