//
//  RestaurantMenuResponse.swift
//  iOSExample
//
//  Created by Fabio Moreira Duarte on 12/03/24.
//

import Foundation

struct RestaurantMenuResponse: Codable {
    let title: String?
    let description: String?
    let imageName: String?
    let subMenus: [RestauranteSubMenu]?
}
