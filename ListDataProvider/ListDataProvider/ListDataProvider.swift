//
//  ListDataProvider.swift
//  ListDataProvider
//
//  Created by 郑林琴 on 16/9/1.
//  Copyright © 2016年 Ice Butterfly. All rights reserved.
//

import Foundation


public protocol ListDataProvider: class {
    
    associatedtype Data
    
    func sectionCount() -> Int
    func rowCount(at section: Int) -> Int
    func data(at indexPath: IndexPath) -> Data
}

public protocol ListCellViewModelProvider: class {
    associatedtype CellModel
    func viewModel(at indexPath: IndexPath) -> CellModel
}
