//
//  RestaurantSubMenuItemView.swift
//  iOSExample
//
//  Created by Fabio Moreira Duarte on 12/03/24.
//

import UIKit

fileprivate extension RestaurantSubMenuItemView.Layout {
    enum Spacing {
        static let nanoSpacing: CGFloat = 8
    }
    
    enum Size {
        static let mediumSize: CGSize = .init(width: 50, height: 50)
    }
    
    enum EdgeInsets {
        static let smallPadding: UIEdgeInsets = .init(top: 12, left: 12, bottom: -12, right: -12)
    }
    
    enum BorderRadius {
        static let nanoSpacing: CGFloat = 8
    }
    
    enum Font {
        static let bigBoldFont: UIFont = .boldSystemFont(ofSize: 25)
    }
    
    enum Color {
        static let whiteColor: UIColor = .white
    }
}

class RestaurantSubMenuItemView: UIView {
    enum Layout {}
    
    private lazy var contentStackView: UIStackView = {
        let contentStackView: UIStackView = .init()
        contentStackView.axis = .horizontal
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        contentStackView.spacing = Layout.Spacing.nanoSpacing
        return contentStackView
    }()
    private lazy var nameLabel: UILabel = {
        let nameLabel: UILabel = .init()
        nameLabel.textColor = Layout.Color.whiteColor
        nameLabel.font = Layout.Font.bigBoldFont
        nameLabel.numberOfLines = 2
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()
    private lazy var imageContentView: UIView = {
        let imageContentView: UIView = .init()
        imageContentView.layer.cornerRadius = Layout.BorderRadius.nanoSpacing
        imageContentView.layer.masksToBounds = true
        imageContentView.backgroundColor = Layout.Color.whiteColor
        imageContentView.translatesAutoresizingMaskIntoConstraints = false
        return imageContentView
    }()
    private lazy var imageView: UIImageView = {
        let imageView: UIImageView = .init()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    private var viewModel: RestaurantSubMenuItemViewModeling
    
    init(viewModel: RestaurantSubMenuItemViewModeling) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        setUpUIElements()
        setUpUIConstraints()
        fillContent()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp(viewModel: RestaurantSubMenuItemViewModeling) {
        self.viewModel = viewModel
        fillContent()
    }
}

// MARK: UI ELEMENTS
extension RestaurantSubMenuItemView {
    private func setUpUIElements() {
        backgroundColor = .clear
        layer.cornerRadius = Layout.BorderRadius.nanoSpacing
        addSubview(contentStackView)
        setUpContentUIElements()
        setUpImageUIElements()
    }
    
    private func setUpContentUIElements() {
        switch viewModel.side {
        case .left:
            contentStackView.addArrangedSubview(imageContentView)
            contentStackView.addArrangedSubview(nameLabel)
            nameLabel.textAlignment = .left
        case .right:
            nameLabel.textAlignment = .right
            contentStackView.addArrangedSubview(nameLabel)
            contentStackView.addArrangedSubview(imageContentView)
        }
    }
    
    private func setUpImageUIElements() {
        imageContentView.addSubview(imageView)
    }
}

// MARK: UI CONSTRAINTS
extension RestaurantSubMenuItemView {
    private func setUpUIConstraints() {
        setUpContentStackUIConstraints()
        setUpImageUIConstraints()
    }
    
    private func setUpContentStackUIConstraints() {
        contentStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Layout.EdgeInsets.smallPadding.left).isActive = true
        contentStackView.topAnchor.constraint(equalTo: topAnchor, constant: Layout.EdgeInsets.smallPadding.top).isActive = true
        contentStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Layout.EdgeInsets.smallPadding.right).isActive = true
        contentStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: Layout.EdgeInsets.smallPadding.bottom).isActive = true
    }
    
    private func setUpImageUIConstraints() {
        imageView.leadingAnchor.constraint(equalTo: imageContentView.leadingAnchor, constant: .zero).isActive = true
        imageView.topAnchor.constraint(equalTo: imageContentView.topAnchor, constant: .zero).isActive = true
        imageView.trailingAnchor.constraint(equalTo: imageContentView.trailingAnchor, constant: .zero).isActive = true
        imageView.bottomAnchor.constraint(equalTo: imageContentView.bottomAnchor, constant: .zero).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: Layout.Size.mediumSize.height).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: Layout.Size.mediumSize.width).isActive = true
    }
}

// MARK: CONTENT
extension RestaurantSubMenuItemView {
    private func fillContent() {
        nameLabel.text = viewModel.name
        imageView.image = viewModel.image
    }
}
