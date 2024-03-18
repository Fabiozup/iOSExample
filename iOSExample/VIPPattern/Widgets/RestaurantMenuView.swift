//
//  RestaurantMenuView.swift
//  iOSExample
//
//  Created by Fabio Moreira Duarte on 12/03/24.
//

import UIKit

fileprivate extension RestaurantMenuView.Layout {
    enum Spacing {
        static let bigSpacing: CGFloat = 50
    }
    
    enum Color {
        static let backgroundColor: UIColor = .black
    }
    
    enum EdgeInsets {
        static let contentPadding: UIEdgeInsets = .init(top: 10, left: 20, bottom: -5, right: -20)
    }
}

class RestaurantMenuView: UIView {
    enum Layout {}
    
    private lazy var scrollView: UIScrollView = {
        let scrollView: UIScrollView = .init()
        scrollView.backgroundColor = .clear
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    private lazy var scrollContentStackView: UIStackView = {
        let scrollContentStackView: UIStackView = .init(frame: .zero)
        scrollContentStackView.axis = .vertical
        scrollContentStackView.translatesAutoresizingMaskIntoConstraints = false
        scrollContentStackView.spacing = Layout.Spacing.bigSpacing
        return scrollContentStackView
    }()
    private lazy var menuTopView: MenuTopView = {
        let menuTopView: MenuTopView = .init()
        menuTopView.translatesAutoresizingMaskIntoConstraints = false
        return menuTopView
    }()
    private lazy var subMenuContentStackView: UIStackView = {
        let subMenuContentStackView: UIStackView = .init(frame: .zero)
        subMenuContentStackView.axis = .vertical
        subMenuContentStackView.translatesAutoresizingMaskIntoConstraints = false
        return subMenuContentStackView
    }()
    
    private var viewModel: RestaurantMenuViewModeling?
    
    init(viewModel: RestaurantMenuViewModeling? = nil) {
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
    
    func setUp(viewModel: RestaurantMenuViewModeling) {
        self.viewModel = viewModel
        fillContent()
    }
}

// MARK: UI ELEMENTS
extension RestaurantMenuView {
    private func setUpUIElements() {
        backgroundColor = Layout.Color.backgroundColor
        setUpScrollUIElements()
        setUpContentUIElements()
    }
    
    private func setUpScrollUIElements() {
        addSubview(scrollView)
        scrollView.addSubview(scrollContentStackView)
    }
    
    private func setUpContentUIElements() {
        scrollContentStackView.addArrangedSubview(menuTopView)
        scrollContentStackView.addArrangedSubview(subMenuContentStackView)
    }
}

// MARK: UI CONSTRAINTS
extension RestaurantMenuView {
    private func setUpUIConstraints() {
        setUpScrollUIConstraints()
    }
    
    private func setUpScrollUIConstraints() {
        scrollView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .zero).isActive = true
        scrollView.topAnchor.constraint(equalTo: topAnchor, constant: .zero).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: .zero).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: .zero).isActive = true
        
        scrollContentStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: Layout.EdgeInsets.contentPadding.left).isActive = true
        scrollContentStackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: Layout.EdgeInsets.contentPadding.top).isActive = true
        scrollContentStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: Layout.EdgeInsets.contentPadding.right).isActive = true
        scrollContentStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: Layout.EdgeInsets.contentPadding.bottom).isActive = true
        scrollContentStackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor, constant: .zero).isActive = true
    }
}

// MARK: CONTENT
extension RestaurantMenuView {
    private func fillContent() {
        menuTopView.setUp(viewModel: viewModel?.menuTopViewModel)
        subMenuContentStackView.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
        viewModel?.subMenuViewModels.forEach {
            subMenuContentStackView.addArrangedSubview(RestaurantSubMenuView(viewModel: $0))
        }
    }
}
