//
//  RestaurantMenuViewModeling.swift
//  iOSExample
//
//  Created by Fabio Moreira Duarte on 12/03/24.
//

import Foundation

protocol RestaurantMenuViewModeling {
    var menuTopViewModel: MenuTopViewModeling? { get }
    var subMenuViewModels: [RestaurantSubMenuViewModeling] { get }
}

class RestaurantMenuViewModel: RestaurantMenuViewModeling {
    private(set) var menuTopViewModel: MenuTopViewModeling?
    private(set) var subMenuViewModels: [RestaurantSubMenuViewModeling] = []
    
    init(response: RestaurantMenuResponse) {
        menuTopViewModel = MenuTopViewModel(response: response)
        subMenuViewModels = response.subMenus?.map {
            RestaurantSubMenuViewModel(subMenu: $0)
        } ?? []
    }
}
