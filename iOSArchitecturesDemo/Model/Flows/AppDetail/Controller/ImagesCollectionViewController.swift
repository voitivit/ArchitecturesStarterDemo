//
//  ImagesCollectionViewController.swift
//  iOSArchitecturesDemo
//
//  Created by emil kurbanov on 14.10.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class ImagesCollectionViewController: UIViewController {
  
  private let app: ITunesApp
  
  let collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    
    let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
    //layout.itemSize = CGSize(width: cv.contentSize.width/5, height: cv.contentSize.height/3)
    cv.translatesAutoresizingMaskIntoConstraints = false
    cv.register(ImagesCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    return cv
  }()
  
  private let scrollView = UIScrollView()
  private let contentView = UIView()
  
  init(app: ITunesApp) {
    self.app = app
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(collectionView)
    collectionView.backgroundColor = .white
    collectionView.delegate = self
    collectionView.dataSource = self
   // setupScrollView()
    setupCollectionConstraints()
  }
  
//  override func viewDidLayoutSubviews() {
//    super.viewDidLayoutSubviews()
//    scrollView.contentSize = CGSize(width: view.frame.size.width, height: view.frame.size.height)
//  }
  
  
  private func setupScrollView() {
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    contentView.translatesAutoresizingMaskIntoConstraints = false
    self.view.addSubview(scrollView)
    scrollView.addSubview(contentView)
    scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
    scrollView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
    scrollView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
    scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    
    
    contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
    contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
    contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
    contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
  }
  func setupCollectionConstraints() {
    
  //  contentView.addSubview(collectionView)
   // collectionView.translatesAutoresizingMaskIntoConstraints = false
    
    
//    NSLayoutConstraint.activate([
//      collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
//      collectionView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
//      collectionView.rightAnchor.constraint(equalTo: contentView.rightAnchor)
//    ])
    
                    collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
                    collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
                    collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
                    collectionView.heightAnchor.constraint(equalToConstant: view.frame.width/2).isActive = true
    
  }
}

extension ImagesCollectionViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: collectionView.frame.width/2.5, height: collectionView.frame.width/2)
  }
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return app.screenshotUrls.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? ImagesCollectionViewCell else { return UICollectionViewCell() }
    guard let photoURL = URL(string: app.screenshotUrls[indexPath.row]) else { return UICollectionViewCell() }
    cell.configure(url: photoURL)
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? ImagesCollectionViewCell
  }
}
extension UICollectionView {
  func scrollToNextItem() {
    let contentOffset = CGFloat(floor(self.contentOffset.x + self.bounds.size.width))
    self.moveToFrame(contentOffset: contentOffset)
  }
  
  func scrollToPreviousItem() {
    let contentOffset = CGFloat(floor(self.contentOffset.x - self.bounds.size.width))
    self.moveToFrame(contentOffset: contentOffset)
  }
  
  func moveToFrame(contentOffset : CGFloat) {
    self.setContentOffset(CGPoint(x: contentOffset, y: self.contentOffset.y), animated: true)
  }
}


