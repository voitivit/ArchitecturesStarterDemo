//
//  SongHeaderViewController.swift
//  iOSArchitecturesDemo
//
//  Created by emil kurbanov on 14.10.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class SongHeaderViewController: UIViewController {

  private let song: ITunesSong
  
  private var songDetailHeaderView: AppDetailHeaderView {
      return self.view as! AppDetailHeaderView
  }
  
  init(song: ITunesSong) {
      self.song = song
      super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }
  
  override func loadView() {
      self.view = AppDetailHeaderView()
  }
  
  override func viewDidLoad() {
      super.viewDidLoad()
      fillData()
  }
  
  private func fillData() {
    guard let url = song.artwork else { return }
    guard let photoUrl = URL(string: url) else { return }
    songDetailHeaderView.imageView.setImage(at: photoUrl)
    songDetailHeaderView.titleLabel.text = song.artistName
    songDetailHeaderView.subTitleLabel.text = song.trackName
    songDetailHeaderView.ratingLabel.text = ""
  }

}
