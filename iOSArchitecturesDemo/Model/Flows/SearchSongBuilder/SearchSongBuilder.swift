//
//  SearchSongBuilder.swift
//  iOSArchitecturesDemo
//
//  Created by emil kurbanov on 18.10.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import Foundation
import UIKit
class SearchSongBuilder {
    static func build() -> (UIViewController & SearchSongViewInput) {
        let interactor = SearchSongInteractor()
        let router = SearchSongRouter()
        let presenter = SearchSongPresenter(interactor: interactor, router: router)
        let viewController = SearchSongViewController(presenter: presenter)
        router.viewController = viewController
        presenter.viewInput = viewController
        
        return viewController
    }
}
