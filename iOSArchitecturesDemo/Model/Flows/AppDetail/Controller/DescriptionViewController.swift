//
//  DescriptionViewController.swift
//  iOSArchitecturesDemo
//
//  Created by emil kurbanov on 14.10.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit
class DescriptionViewController: UIViewController {
    
    private let app: ITunesApp
    
    private var descriptionViewController: DescriptionView {
        return self.view as! DescriptionView
    }
    
    init(app: ITunesApp) {
        self.app = app
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = DescriptionView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fillData()
    }
    
    private func fillData() {
       
        
      descriptionViewController.descriptionLabel.text = app.appDescription
      
    }
}
