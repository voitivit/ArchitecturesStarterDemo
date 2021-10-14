//
//  SongDetailViewController.swift
//  iOSArchitecturesDemo
//
//  Created by emil kurbanov on 14.10.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit
class SongDetailViewController: UIViewController {

  public var song: ITunesSong
  lazy var headerViewController = SongHeaderViewController(song: song)

  
  private var appDetailView: AppDetailHeaderView {
      return self.view as! AppDetailHeaderView
  }
  
  init(song: ITunesSong) {
      self.song = song
      super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Lifecycle

  override func viewDidLoad() {
      super.viewDidLoad()
      configureUI()
  }
  
  // MARK: - Private
  
  private func configureUI() {
      view.backgroundColor = .white
      self.navigationController?.navigationBar.tintColor = UIColor.white;
      self.navigationItem.largeTitleDisplayMode = .never
      
    addHeaderViewController()
  }
  
  private func addHeaderViewController() {
      self.addChild(headerViewController)
      self.view.addSubview(headerViewController.view)
      headerViewController.didMove(toParent: self)
      
      headerViewController.view.translatesAutoresizingMaskIntoConstraints = false
      
      NSLayoutConstraint.activate([
          headerViewController.view.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
          headerViewController.view.leftAnchor.constraint(equalTo: self.view.leftAnchor),
          headerViewController.view.rightAnchor.constraint(equalTo: self.view.rightAnchor)
      ])
  }

   }


