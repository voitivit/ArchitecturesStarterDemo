//
//  SearchRouterInput.swift
//  iOSArchitecturesDemo
//
//  Created by emil kurbanov on 18.10.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import Foundation
import UIKit

protocol SearchRouterInput {
    func openDetails(for app: ITunesApp)
    func openAppInItunes(app: ITunesApp)
}

class SearchRouter: SearchRouterInput {
    weak var viewController: UIViewController?
    
    func openDetails(for app: ITunesApp) {
        let appDetailViewController = AppDetailViewController(app: app)
        viewController?.navigationController?.pushViewController(appDetailViewController, animated: true)
    }
    
    func openAppInItunes(app: ITunesApp) {
        guard let urlString = app.appUrl,
              let url = URL(string: urlString) else {
                  return
              }
        
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}
