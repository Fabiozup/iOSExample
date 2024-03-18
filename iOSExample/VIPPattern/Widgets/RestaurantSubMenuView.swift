//
//  RestaurantSubMenuView.swift
//  iOSExample
//
//  Created by Fabio Moreira Duarte on 12/03/24.
//

import UIKit

fileprivate extension RestaurantSubMenuView.Layout {
    enum Spacing {
        static let nanoSpacing: CGFloat = 8
        static let bigSpacing: CGFloat = 24
    }
    
    enum EdgeInsets {
        static let atomPadding: UIEdgeInsets = .init(top: 2, left: 2, bottom: -2, right: -2)
        static let customPadding: UIEdgeInsets = .init(top: 100, left: .zero, bottom: .zero, right: .zero)
    }
    
    enum BorderRadius {
        static let nanoSpacing: CGFloat = 8
    }
    
    enum Font {
        static let bigBoldFont: UIFont = .boldSystemFont(ofSize: 30)
        static let italicFont: UIFont = .italicSystemFont(ofSize: 20)
    }
    
    enum Color {
        static let whiteColor: UIColor = .white
    }
}

class RestaurantSubMenuView: UIView {
    enum Layout {}
    
    private lazy var backgroundImageView: UIImageView = {
        let backgroundImageView: UIImageView = .init()
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.layer.cornerRadius = Layout.BorderRadius.nanoSpacing
        backgroundImageView.layer.masksToBounds = true
        return backgroundImageView
    }()
    private lazy var contentStackView: UIStackView = {
        let contentStackView: UIStackView = .init()
        contentStackView.axis = .vertical
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        contentStackView.spacing = Layout.Spacing.nanoSpacing
        return contentStackView
    }()
    private lazy var informationContentStackView: UIStackView = {
        let informationContentStackView: UIStackView = .init()
        informationContentStackView.axis = .vertical
        informationContentStackView.translatesAutoresizingMaskIntoConstraints = false
        informationContentStackView.spacing = Layout.Spacing.bigSpacing
        return informationContentStackView
    }()
    private lazy var titleLabel: UILabel = {
        let titleLabel: UILabel = .init()
        titleLabel.textColor = Layout.Color.whiteColor
        titleLabel.font = Layout.Font.bigBoldFont
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    private lazy var descriptionLabel: UILabel = {
        let descriptionLabel: UILabel = .init()
        descriptionLabel.textColor = Layout.Color.whiteColor
        descriptionLabel.font = Layout.Font.italicFont
        descriptionLabel.numberOfLines = .zero
        descriptionLabel.textAlignment = .center
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        return descriptionLabel
    }()
    private lazy var subItemsContentView: UIView = {
        let subItemsContentView: UIView = .init()
        subItemsContentView.translatesAutoresizingMaskIntoConstraints = false
        return subItemsContentView
    }()
    private lazy var subItemsContentStackView: UIStackView = {
        let subItemsContentStackView: UIStackView = .init()
        subItemsContentStackView.axis = .vertical
        subItemsContentStackView.translatesAutoresizingMaskIntoConstraints = false
        subItemsContentStackView.spacing = Layout.Spacing.nanoSpacing
        return subItemsContentStackView
    }()
    
    private var viewModel: RestaurantSubMenuViewModeling?
    
    init(viewModel: RestaurantSubMenuViewModeling) {
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
}

// MARK: UI ELEMENTS
extension RestaurantSubMenuView {
    private func setUpUIElements() {
        backgroundColor = .clear
        addSubview(contentStackView)
        setUpContentUIElements()
        setUpInformationUIElements()
        setUpSubItemsUIElements()
    }
    
    private func setUpContentUIElements() {
        contentStackView.addArrangedSubview(informationContentStackView)
        contentStackView.addArrangedSubview(subItemsContentView)
    }
    
    private func setUpInformationUIElements() {
        informationContentStackView.addArrangedSubview(titleLabel)
        informationContentStackView.addArrangedSubview(descriptionLabel)
    }
    
    private func setUpSubItemsUIElements() {
        subItemsContentView.addSubview(backgroundImageView)
        subItemsContentView.addSubview(subItemsContentStackView)
    }
}

// MARK: UI CONSTRAINTS
extension RestaurantSubMenuView {
    private func setUpUIConstraints() {
        setUpContentStackUIConstraints()
        setUpImageUIConstraints()
        setUpSubItemsUIConstraints()
    }
    
    private func setUpContentStackUIConstraints() {
        contentStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Layout.EdgeInsets.atomPadding.left).isActive = true
        contentStackView.topAnchor.constraint(equalTo: topAnchor, constant: Layout.EdgeInsets.atomPadding.top).isActive = true
        contentStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Layout.EdgeInsets.atomPadding.right).isActive = true
        contentStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: Layout.EdgeInsets.atomPadding.bottom).isActive = true
    }
    
    private func setUpImageUIConstraints() {
        backgroundImageView.leadingAnchor.constraint(equalTo: subItemsContentView.leadingAnchor, constant: .zero).isActive = true
        backgroundImageView.topAnchor.constraint(equalTo: subItemsContentView.topAnchor, constant: .zero).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo: subItemsContentView.trailingAnchor, constant: .zero).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: subItemsContentView.bottomAnchor, constant: .zero).isActive = true
    }
    
    private func setUpSubItemsUIConstraints() {
        subItemsContentStackView.leadingAnchor.constraint(equalTo: subItemsContentView.leadingAnchor, constant: Layout.EdgeInsets.customPadding.left).isActive = true
        subItemsContentStackView.topAnchor.constraint(equalTo: subItemsContentView.topAnchor, constant: Layout.EdgeInsets.customPadding.top).isActive = true
        subItemsContentStackView.trailingAnchor.constraint(equalTo: subItemsContentView.trailingAnchor, constant: Layout.EdgeInsets.customPadding.right).isActive = true
        subItemsContentStackView.bottomAnchor.constraint(equalTo: subItemsContentView.bottomAnchor, constant: Layout.EdgeInsets.customPadding.bottom).isActive = true
    }
}

// MARK: CONTENT
extension RestaurantSubMenuView {
    private func fillContent() {
        titleLabel.text = viewModel?.title
        descriptionLabel.text = viewModel?.description
        backgroundImageView.image = viewModel?.backgroundImage
        subItemsContentStackView.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
        viewModel?.itemsViewModels.forEach {
            subItemsContentStackView.addArrangedSubview(RestaurantSubMenuItemView(viewModel: $0))
        }
    }
}
