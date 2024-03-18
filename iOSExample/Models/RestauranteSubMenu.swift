//
//  RestauranteSubMenu.swift
//  iOSExample
//
//  Created by Fabio Moreira Duarte on 12/03/24.
//

import Foundation

struct RestauranteSubMenu: Codable {
    let title: String?
    let description: String?
    let backgroundImageName: String?
    let items: [RestauranteSubMenuItem]?
}
