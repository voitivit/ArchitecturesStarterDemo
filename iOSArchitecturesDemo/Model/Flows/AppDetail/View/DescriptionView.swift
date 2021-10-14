//
//  DescriptionView.swift
//  iOSArchitecturesDemo
//
//  Created by emil kurbanov on 14.10.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit
class DescriptionView: UIView {
    
    private(set) lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black 
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.numberOfLines = 6
        label.backgroundColor = .lightText
        return label
    }()
    
    private(set) lazy var developerLabel: UILabel = {
      let label = UILabel()
      label.translatesAutoresizingMaskIntoConstraints = false
      label.textColor = .systemBlue
      label.font = UIFont.boldSystemFont(ofSize: 12)
      label.numberOfLines = 0
      return label
    }()
    
    let scrollView = UIScrollView()
    let contentView = UIView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
    }
    
    
    private func configureUI() {
        self.addSubview(descriptionLabel)
        NSLayoutConstraint.activate([

          descriptionLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 12),
          descriptionLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12),
          descriptionLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -12),
        ])
        
      }
    }

