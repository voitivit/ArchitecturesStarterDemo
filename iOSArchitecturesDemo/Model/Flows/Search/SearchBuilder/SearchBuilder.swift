//
//  SearchBuilder.swift
//  iOSArchitecturesDemo
//
//  Created by Veaceslav Chirita on 08.10.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class SearchBuilder {
  
  static func build() -> UIViewController {
    let viewController = StartViewController()
    return viewController
  }
  
  static func buildForApp() -> (UIViewController & SearchAppViewInput) {
    let presenter = SearchAppPresenter()
    let viewController = SearchViewController(presenter: presenter)
    viewController.navigationItem.title = "Search Apps via iTunes"
    presenter.viewInput = viewController
    return viewController
  }
  
  static func buildForSong() -> (UIViewController & SearchSongsViewInput) {
    let presenter = SearchMusicPresenter()
    let viewController = SearchSongsViewController(presenter: presenter)
    viewController.navigationItem.title = "Search Songs via iTunes"
    presenter.viewInput = viewController
    return viewController
  }
}
