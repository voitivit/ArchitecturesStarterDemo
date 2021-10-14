//
//  StartView.swift
//  iOSArchitecturesDemo
//
//  Created by emil kurbanov on 14.10.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import Foundation
import UIKit


protocol startProtocol: AnyObject {
  func appSearch()
  func songSearch()
}

class StartView: UIView {
  
  weak var delegate: startProtocol?
  // MARK: - Subviews
  let segmentalControl = UISegmentedControl(items: ["Apps","Songs"])
  
  // MARK: - Init
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.configureUI()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    self.configureUI()
  }
  
  // MARK: - UI
  
  private func configureUI() {
      self.backgroundColor  = .varna
    self.addsegmentalControl()
    self.setupConstraints()
  }
  
  private func addsegmentalControl() {
    self.segmentalControl.translatesAutoresizingMaskIntoConstraints = false
      self.segmentalControl.backgroundColor = .lightText
    self.segmentalControl.addTarget(self, action: #selector(segmentControl(_:)), for: .valueChanged)
    self.addSubview(self.segmentalControl)
  }
  
  
  private func setupConstraints() {
    let safeArea = self.safeAreaLayoutGuide
    
    NSLayoutConstraint.activate([
      
      self.segmentalControl.topAnchor.constraint(equalTo: self.topAnchor, constant: 8.0),
      self.segmentalControl.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
      self.segmentalControl.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor)
    ])
  }
  
  @objc func segmentControl(_ segmentedControl: UISegmentedControl) {
    switch (segmentedControl.selectedSegmentIndex) {
    case 0:
      delegate?.appSearch()
      break
    case 1:
      delegate?.songSearch()
      break
    default:
      break
    }
  }
}

