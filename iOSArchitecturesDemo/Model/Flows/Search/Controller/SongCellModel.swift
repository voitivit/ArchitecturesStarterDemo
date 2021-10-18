//
//  SongCellModel.swift
//  iOSArchitecturesDemo
//
//  Created by emil kurbanov on 18.10.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import Foundation

struct SongCellModel {
    let trackName: String
    let album: String?
    let artist: String?
}

final class SongCellModelFactory {
    
    static func cellModel(from model: ITunesSong) -> SongCellModel {
        return SongCellModel(trackName: model.trackName,
                             album: model.collectionName,
                             artist: model.artistName)
    }
}
