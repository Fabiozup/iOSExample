//
//  MenuTopView.swift
//  iOSExample
//
//  Created by Fabio Moreira Duarte on 12/03/24.
//

import UIKit

fileprivate extension MenuTopView.Layout {
    enum Spacing {
        static let smallSpacing: CGFloat = 12
    }
    
    enum Size {
        static let mediumSize: CGSize = .init(width: 60, height: 60)
    }
    
    enum EdgeInsets {
        static let atomPadding: UIEdgeInsets = .init(top: 2, left: 2, bottom: -2, right: -2)
    }
    
    enum Font {
        static let bigBoldFont: UIFont = .boldSystemFont(ofSize: 30)
        static let italicFont: UIFont = .italicSystemFont(ofSize: 20)
    }
    
    enum Color {
        static let whiteColor: UIColor = .white
    }
}

class MenuTopView: UIView {
    enum Layout {}
    
    private lazy var contentStackView: UIStackView = {
        let contentStackView: UIStackView = .init()
        contentStackView.axis = .vertical
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        contentStackView.spacing = Layout.Spacing.smallSpacing
        return contentStackView
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
    private lazy var imageContentView: UIView = {
        let imageContentView: UIView = .init()
        imageContentView.translatesAutoresizingMaskIntoConstraints = false
        return imageContentView
    }()
    private lazy var imageView: UIImageView = {
        let imageView: UIImageView = .init()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private var viewModel: MenuTopViewModeling?
    
    init(viewModel: MenuTopViewModeling? = nil) {
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
    
    func setUp(viewModel: MenuTopViewModeling?) {
        self.viewModel = viewModel
        fillContent()
    }
}

// MARK: UI ELEMENTS
extension MenuTopView {
    private func setUpUIElements() {
        backgroundColor = .clear
        addSubview(contentStackView)
        
        contentStackView.addArrangedSubview(imageContentView)
        contentStackView.addArrangedSubview(descriptionLabel)
        contentStackView.addArrangedSubview(titleLabel)
        imageContentView.addSubview(imageView)
    }
}

// MARK: UI CONSTRAINTS
extension MenuTopView {
    private func setUpUIConstraints() {
        setUpContentStackUIConstraints()
        setUpImageViewUIConstraints()
    }
    
    private func setUpContentStackUIConstraints() {
        contentStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .zero).isActive = true
        contentStackView.topAnchor.constraint(equalTo: topAnchor, constant: .zero).isActive = true
        contentStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: .zero).isActive = true
        contentStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: .zero).isActive = true
    }
    
    private func setUpImageViewUIConstraints() {
        imageView.leadingAnchor.constraint(greaterThanOrEqualTo: imageContentView.leadingAnchor, constant: .zero).isActive = true
        imageView.topAnchor.constraint(equalTo: imageContentView.topAnchor, constant: .zero).isActive = true
        imageView.trailingAnchor.constraint(lessThanOrEqualTo: imageContentView.trailingAnchor, constant: .zero).isActive = true
        imageView.bottomAnchor.constraint(equalTo: imageContentView.bottomAnchor, constant: .zero).isActive = true
        imageView.centerXAnchor.constraint(equalTo: imageContentView.centerXAnchor, constant: .zero).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: Layout.Size.mediumSize.height).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: Layout.Size.mediumSize.width).isActive = true
    }
}

// MARK: CONTENT
extension MenuTopView {
    private func fillContent() {
        titleLabel.text = viewModel?.title
        descriptionLabel.text = viewModel?.description
        imageView.image = viewModel?.imageLogo
        imageContentView.isHidden = viewModel?.imageLogo == nil
    }
}
