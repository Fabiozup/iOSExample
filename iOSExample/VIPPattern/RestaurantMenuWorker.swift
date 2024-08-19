//
//  RestaurantMenuWorker.swift
//  iOSExample
//
//  Created by Fabio Moreira Duarte on 12/03/24.
//

import Foundation

typealias MenuCompletion = (RestaurantMenuResponse) -> Void

protocol RestaurantMenuWorkerInput {
    func requestMenu(completion: @escaping MenuCompletion)
}

class RestaurantMenuWorker {}

extension RestaurantMenuWorker: RestaurantMenuWorkerInput {
    func requestMenu(completion: @escaping MenuCompletion) {
        completion(
            .init(
                title: "MENU",
                description: "Experimente agora nossa variedade de pratos, preparados com os mais exoticos ingredientes. Colhidos pelos nossos bravos ex funcionarios, que suas memorias vivam para sempre. PS: temos vagas",
                imageName: "funnyChef",
                subMenus: [
                    .init(
                        title: "Frutos do MAR",
                        description: "Os melhores cortes do sete mares, feito especialmente das criaturas mais saboras das profundezas do oceano. Recomenda-se que pessoas com alergia a frutos do mar pagar a conta em adiando.",
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
                        description: "A raca de insetos mais crocantes direto para seu prato, a raca Terminidia que ocupa 30% da nossa galaxia e com crescimento exponencial, fica otima com acompanhamento. Recomenda-se saborear o prato antes que o enxame chegue na Terra.",
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
                    ),
                    .init(
                        title: "Sabores do passado",
                        description: "O Maior predador do periódo Crétaceo, obtido através de nossa maquina de tempo do nosso parceria 'Im back Timechines', está disponivél por um breve período, serve 25 pessoas. Curiosidade ficar imóvel não impede que ele te veja, agrademos nossa equipe de coleta por essa informação, que Deus os tenha.",
                        backgroundImageName: "trex",
                        items: [
                            .init(
                                name: "Assado inteiro acompanhado com batata",
                                imageName: "cookedBird"
                            ),
                            .init(
                                name: "Tacos com carne desfiada",
                                imageName: "mexicanFood"
                            )
                        ]
                    ),
                    .init(
                        title: "Gosta de picancia? esta no lugar certo",
                        description: "Os dragoes de Arzulgarum é a escolha, com sua carne pode chegar a incriveis 1200 Celsius. Recomenda-se acompanhamento de bebida",
                        backgroundImageName: "dragon",
                        items: [
                            .init(
                                name: "Picanha na brasa extremanate picante",
                                imageName: "barbecue1"
                            ),
                            .init(
                                name: "Hamburguer de cauda tostado com bafo dragonico",
                                imageName: "burger1"
                            )
                        ]
                    )
                ]
            )
        )
    }
}
