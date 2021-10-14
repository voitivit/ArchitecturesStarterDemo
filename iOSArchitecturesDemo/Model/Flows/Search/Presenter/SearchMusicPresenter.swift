//
//  SearchMusicPresenter.swift
//  iOSArchitecturesDemo
//
//  Created by emil kurbanov on 14.10.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit
protocol SearchSongsViewInput: AnyObject {
    var searchResults: [ITunesSong] { get set }
    
    func showError(error: Error)
    func showNoResults()
    func hideNoResults()
    func throbber(show: Bool)
}

protocol SearchSongsViewOutput: AnyObject {
    func viewDidSearch(with query: String)
    func viewDidSelect(song: ITunesSong)
}

class SearchMusicPresenter {
    weak var viewInput: (UIViewController & SearchSongsViewInput)?
    private let searchService = ITunesSearchService()
    
    private func requestApp(with query: String) {
        self.searchService.getSongs(forQuery: query) { [weak self] result in
            guard let self = self else { return }
            result
                .withValue { apps in
                    guard !apps.isEmpty else {
                        self.viewInput?.showNoResults()
                        return
                    }
                    self.viewInput?.hideNoResults()
                    self.viewInput?.searchResults = apps
                }
                .withError { (error) in
                    self.viewInput?.showError(error: error)
                }
        }
    }
    
    private func openAppDetails(with song: ITunesSong) {
        let SongDetailViewController = SongDetailViewController(song: song)
        viewInput?.navigationController?.pushViewController(SongDetailViewController, animated: true)
    }
    
}

extension SearchMusicPresenter: SearchSongsViewOutput {
  func viewDidSelect(song: ITunesSong) {
    openAppDetails(with: song)
  }
  
    func viewDidSearch(with query: String) {
        viewInput?.throbber(show: false)
        requestApp(with: query)
    }
}
