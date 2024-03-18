//
//  MenuTopViewModeling.swift
//  iOSExample
//
//  Created by Fabio Moreira Duarte on 12/03/24.
//

import UIKit

protocol MenuTopViewModeling {
    var title: String { get }
    var description: String { get }
    var imageLogo: UIImage? { get }
}

class MenuTopViewModel: MenuTopViewModeling {
    private(set) var title: String = .init()
    private(set) var description: String = .init()
    private(set) var imageLogo: UIImage?
    
    init(response: RestaurantMenuResponse) {
        title = response.title ?? .init()
        description = response.description ?? .init()
        imageLogo = UIImage(named: response.imageName ?? .init())
    }
}
