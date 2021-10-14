//
//  StrategyProtocol.swift
//  iOSArchitecturesDemo
//
//  Created by emil kurbanov on 14.10.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import Foundation

enum DataType: Int {
  case app = 0,
       music
}


protocol StrategyProtocol: AnyObject {
  var searchType: DataType { get set }
}


class StrategyChooser {
    var strategy: StrategyProtocol
    
    init(strategy: StrategyProtocol) {
        self.strategy = strategy
    }
    
}
