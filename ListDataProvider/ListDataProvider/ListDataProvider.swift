//
//  ListDataProvider.swift
//  ListDataProvider
//
//  Created by 郑林琴 on 16/9/1.
//  Copyright © 2016年 Ice Butterfly. All rights reserved.
//

import Foundation


public protocol ListCellViewModel {
    associatedtype E
    var entity: E { get }
    init(entity: E)
}


public protocol ListCellViewModelProvider{
    associatedtype CellViewModel: ListCellViewModel
    func viewModelAt(indexPath: IndexPath) -> CellViewModel
}

extension ListCellViewModelProvider where Self: ListDataProvider, Data == CellViewModel.E{
    
    func viewModelAt(indexPath: IndexPath) -> CellViewModel {
        let item = self.dataAt(indexPath: indexPath)
        return CellViewModel(entity: item as! CellViewModel.E)
    }
}

public protocol ListDataProvider {
    
    associatedtype Data
    
    func sectionCount() -> Int
    func rowCountAt(section: Int) -> Int
    func dataAt(indexPath: IndexPath) -> Data

}
