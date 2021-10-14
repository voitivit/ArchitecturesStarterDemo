//
//  StartViewController.swift
//  iOSArchitecturesDemo
//
//  Created by emil kurbanov on 14.10.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {
  
  private var searchView: StartView {
    return self.view as! StartView
  }
  
  init() {
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Lifecycle
  
  override func loadView() {
    super.loadView()
    self.view = StartView()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationController?.navigationBar.prefersLargeTitles = true
    searchView.delegate = self
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
  }
}

//MARK: - UITableViewDataSource

extension StartViewController: startProtocol {
  func appSearch() {
    let viewController = SearchBuilder.buildForApp()
    navigationController?.pushViewController(viewController, animated: true)
  }
  
  func songSearch() {
    let viewController = SearchBuilder.buildForSong()
    navigationController?.pushViewController(viewController, animated: true)
  }
}
