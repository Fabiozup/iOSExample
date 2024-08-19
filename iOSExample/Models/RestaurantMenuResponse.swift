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
    
    static var mock: RestaurantMenuResponse = {
        .init(
            title: "MENU",
            description: "Experimente agora nossa variedade de pratos, preparados com os mais exoticos ingredientes",
            imageName: "funnyChef",
            subMenus: [
                .init(
                    title: "Frutos do MAR",
                    description: "Os melhores cortes do sete mares, feito especialmente das criaturas mais saboras das profundezas do oceano",
                    backgroundImageName: "megalodon",
                    items: [
                        .init(
                            name: "Sushi de Megalodon",
                            imageName: "sushi"
                        ),
                        .init(
                            name: "Temaki de Polvo gigante",
                            imageName: "temaki"
                        )
                    ]
                ),
                .init(
                    title: "Sabores de outro mundo",
                    description: "A raca de insetos mais crocantes da galaxia",
                    backgroundImageName: "bug",
                    items: [
                        .init(
                            name: "Espetinho crocante de baratossauros",
                            imageName: "bugFood1"
                        ),
                        .init(
                            name: "Combo de escorpioridicos",
                            imageName: "bugFood2"
                        )
                    ]
                )
            ]
        )
    }()
}
