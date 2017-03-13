//
//  ListCellModelProvider.swift
//  ListDataProvider
//
//  Created by ET|冰琳 on 2017/3/13.
//  Copyright © 2017年 Ice Butterfly. All rights reserved.
//

import UIKit


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
