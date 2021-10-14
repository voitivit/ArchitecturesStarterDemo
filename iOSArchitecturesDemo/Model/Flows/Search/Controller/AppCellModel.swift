//
//  AppCellModel.swift
//  iOSArchitecturesDemo
//
//  Created by Evgeny Kireev on 02/06/2019.
//  Copyright © 2019 ekireev. All rights reserved.
//

import Foundation


struct AppCellModel {
    let title: String
    let subtitle: String?
    let rating: String?
}

final class AppCellModelFactory {
    
    static func cellModelApp(from model: ITunesApp) -> AppCellModel {
        return AppCellModel(title: model.appName,
                            subtitle: model.company,
                            rating: model.averageRating >>- { "\($0)" })
    }
  static func cellModelSong(from model: ITunesSong) -> AppCellModel {
      return AppCellModel(title: model.artistName!,
                          subtitle: model.trackName,
                          rating: "")
  }
}
