//
//  AppDetailWhatsNewViewController.swift
//  iOSArchitecturesDemo
//
//  Created by emil kurbanov on 18.10.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class AppDetailCorrectVC: UIViewController {
    
    private let app: ITunesApp
    
    private var appDetailWhatsNewView: AppDetailVC {
        return self.view as! AppDetailVC
    }
    
    init(app: ITunesApp) {
        self.app = app
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = AppDetailVC()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fillData()
    }
    
    private func fillData() {
        appDetailWhatsNewView.titleLabel.text = "Что нового"
        appDetailWhatsNewView.versionLabel.text = "Версия \(app.version ?? "0.0.0")"
        appDetailWhatsNewView.lastUpdatedLabel.text = app.currentVersionReleaseDate
        appDetailWhatsNewView.updateInfoLabel.text = app.releaseNotes
    }
}
