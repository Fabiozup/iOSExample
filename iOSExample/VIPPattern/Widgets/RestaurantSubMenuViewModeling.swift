//
//  RestaurantSubMenuViewModeling.swift
//  iOSExample
//
//  Created by Fabio Moreira Duarte on 13/03/24.
//

import UIKit

protocol RestaurantSubMenuViewModeling {
    var title: String { get }
    var description: String { get }
    var backgroundImage: UIImage? { get }
    var itemsViewModels: [RestaurantSubMenuItemViewModeling] { get }
}

class RestaurantSubMenuViewModel: RestaurantSubMenuViewModeling {
    private(set) var title: String = .init()
    private(set) var description: String = .init()
    private(set) var backgroundImage: UIImage?
    private(set) var itemsViewModels: [RestaurantSubMenuItemViewModeling] = []
    
    init(subMenu: RestauranteSubMenu) {
        title = subMenu.title ?? .init()
        description = subMenu.description ?? .init()
        backgroundImage = UIImage(named: subMenu.backgroundImageName ?? .init())
        var tempItemsViewModels: [RestaurantSubMenuItemViewModeling] = []
        for (index, item) in (subMenu.items ?? []).enumerated() {
            tempItemsViewModels.append(
                RestaurantSubMenuItemViewModel(
                    item: item,
                    side: index % 2 == 0 ? .right : .left
                )
            )
        }
        itemsViewModels = tempItemsViewModels
    }
}
