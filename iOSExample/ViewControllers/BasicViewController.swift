//
//  BasicViewController.swift
//  iOSExample
//
//  Created by Fabio Moreira Duarte on 29/02/24.
//

import UIKit

class BasicViewController: UIViewController {
    private lazy var scrollView: UIScrollView = {
        let scrollView: UIScrollView = .init()
        scrollView.backgroundColor = .orange
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var scrollContentStackView: UIStackView = {
        let scrollContentStackView: UIStackView = .init(frame: .zero)
        scrollContentStackView.spacing = 20
        scrollContentStackView.axis = .vertical
        scrollContentStackView.translatesAutoresizingMaskIntoConstraints = false
        return scrollContentStackView
    }()
    
    private lazy var redView: UIView = {
        let redView: UIView = .init(frame: .zero)
        redView.backgroundColor = .red
        redView.translatesAutoresizingMaskIntoConstraints = false
        return redView
    }()
    
    private lazy var textLabel: UILabel = {
        let textLabel: UILabel = .init(frame: .zero)
        textLabel.text = "Texto de exemplo"
        textLabel.backgroundColor = .green
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        return textLabel
    }()
    
    private lazy var imageView: UIImageView = {
        let image = UIImage(named: "appleLogo")
        let imageView: UIImageView = .init(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        setUpElements()
        setUpConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}

extension BasicViewController {
    private func setUpElements() {
        view.addSubview(scrollView)
        
        scrollView.addSubview(scrollContentStackView)
        
        scrollContentStackView.addArrangedSubview(redView)
        scrollContentStackView.addArrangedSubview(textLabel)
        scrollContentStackView.addArrangedSubview(imageView)
    }
    
    private func setUpConstraints() {
        scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        
        scrollContentStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20).isActive = true
        scrollContentStackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10).isActive = true
        scrollContentStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 20).isActive = true
        scrollContentStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 10).isActive = true
        scrollContentStackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor, constant: 0).isActive = true
        
        redView.heightAnchor.constraint(equalToConstant: 100).isActive = true

        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1).isActive = true
    }
}
