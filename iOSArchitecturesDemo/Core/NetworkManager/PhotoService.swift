//
//  PhotoService.swift
//  iOSArchitecturesDemo
//
//  Created by emil kurbanov on 14.10.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit
import Alamofire
class PhotoService {
  
  private static let cacheLifeTime: TimeInterval = 7 * 24 * 60 * 60
  
  private static let cacheImagesURL: URL? = {
    let path = "Images"
    
    guard let cacheDirectory = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else {
      return nil
    }
    
    let imagesFolderURL = cacheDirectory.appendingPathComponent(path, isDirectory: true)
    
    if !FileManager.default.fileExists(atPath: imagesFolderURL.path) {
      try? FileManager.default.createDirectory(at: imagesFolderURL, withIntermediateDirectories: true, attributes: [:])
    }
    return imagesFolderURL
  }()
  
  private var memoryImageCache: [String: UIImage] = [:]
  
  // MARK: - Private Methods
  
  private func getFilePath(at url: URL) -> String? {
    let hashName = url.absoluteString
    return Self.cacheImagesURL?.appendingPathComponent(hashName).path
  }
  private func saveImageToCache(_ image: UIImage, with url: URL) {
    guard let filePath = self.getFilePath(at: url) else { return }
    let imageData = image.pngData()
    FileManager.default.createFile(atPath: filePath, contents: imageData)
  //  print(self.memoryImageCache)
  }
  
  private func getImageFromCache(at url: URL) -> UIImage? {
    guard let filePath = self.getFilePath(at: url) else { return nil }
    guard let modificationDate = try? FileManager.default.attributesOfItem(atPath: filePath)[.modificationDate] as? Date else {
      return nil
    }
    let lifeTime = Date().timeIntervalSince(modificationDate ?? Date())
    guard lifeTime <= Self.cacheLifeTime,
          let image = UIImage(contentsOfFile: filePath) else {
      return nil
    }
    DispatchQueue.main.async {
      self.memoryImageCache[filePath] = image
    }
    return image
  }
}

extension PhotoService {
  
  static let shared = PhotoService()
  func loadImage(at url: URL, completion: @escaping (UIImage?) -> Void) {
    Alamofire.request(url).responseData(queue: DispatchQueue.global()) { [weak self] response in
      guard
        let data = response.data,
        let image = UIImage(data: data),
        let self = self else { return }
      DispatchQueue.main.async {
        guard let filePath = self.getFilePath(at: url) else { return }
        self.memoryImageCache[filePath] = image
      }
      self.saveImageToCache(image, with: url)
      DispatchQueue.main.async {
        completion(image)
      }
    }.resume()
  }
  
  func getPhoto(at url: URL, completion: @escaping (UIImage?) -> Void) {
    if let filePath = self.getFilePath(at: url),
       let image = self.memoryImageCache[filePath] {
      return completion(image)
    } else
    if let image = self.getImageFromCache(at: url) {
      return completion(image) }
    else {
      self.loadImage(at: url, completion: completion)
    }
  }
}

extension UIImageView {
  func setImage(at url: URL) {
    DispatchQueue.main.async {
      PhotoService.shared.getPhoto(at: url) { [weak self] image in
        self?.image = image
      }
    }
  }
}

