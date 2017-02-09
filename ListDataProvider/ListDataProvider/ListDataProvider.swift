//
//  ListDataProvider.swift
//  ListDataProvider
//
//  Created by 郑林琴 on 16/9/1.
//  Copyright © 2016年 Ice Butterfly. All rights reserved.
//

import Foundation

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


extension ListDataProvider where Self: ArrayContainer{
    
    public func sectionCount() -> Int{
        return self.items.count > 0 ? 1 : 0
    }
    
    public func rowCountAt(section: Int) -> Int{
        return self.items.count
    }
    
    public func dataAt(indexPath: IndexPath) -> Data{
        return self.items[indexPath.row]
    }
}


extension ListDataProvider where Self: SectionedArrayContainer{
    
    public func sectionCount() -> Int{
        return self.items.count
    }
    
    public func rowCountAt(section: Int) -> Int{
        return self.items[section].count
    }
    
    public func dataAt(indexPath: IndexPath) -> Data{
        return self.items[indexPath.section][indexPath.row]
    }
}

extension ListDataProvider where Self: SectionedSingleItemContainer{
    
    public func sectionCount() -> Int{
        return self.items.count
    }
    
    public func rowCountAt(section: Int) -> Int{
        return 1
    }
    
    public func dataAt(indexPath: IndexPath) -> Data{
        return self.items[indexPath.section]
    }
}

extension ListDataProvider where Self: EntityContainer{
    func dataAt(indexPath: IndexPath) -> Data{
        return self.entity
    }
}







public protocol PagedListDataProvider: ListDataProvider {
    func isEmpty() -> Bool
    var hasMore: Bool { get set }
}


extension PagedListDataProvider where Self: ArrayContainer{
    
    public func isEmpty() -> Bool {
        return self.items.count == 0
    }
    
    /**
     计算页码
     
     - parameter count: 每页个数
     - parameter more:  是否是加载更多
     */
    public func pageIndex(withPageCount count: Int, more: Bool, defaultStartIndex: Int = 1) -> Int{
        if more == false{
            return defaultStartIndex
        }
        let total = self.items.count
        return Int( ceil( Double(total) / Double(count))) + defaultStartIndex
    }
    
    
    public mutating func append(contentsOf: [Data], more: Bool, pageCount: Int) {
        if more == false {
            self.items.removeAll()
        }
        self.items.append(contentsOf: contentsOf)
        
        if contentsOf.count < pageCount {
            self.hasMore = false
        }else{
            self.hasMore = true
        }
    }
    
}

extension PagedListDataProvider where Self: SectionedSingleItemContainer{
    
    public func isEmpty() -> Bool {
        return self.items.count == 0
    }
    
    /**
     计算页码
     
     - parameter count: 每页个数
     - parameter more:  是否是加载更多
     */
    public func pageIndex(withPageCount count: Int, more: Bool, defaultStartIndex: Int = 1) -> Int{
        if more == false{
            return defaultStartIndex
        }
        let total = self.items.count
        return Int( ceil( Double(total) / Double(count))) + defaultStartIndex
    }
    
    public mutating func append(contentsOf: [Data], more: Bool, pageCount: Int) {
        if more == false {
            self.items.removeAll()
        }
        self.items.append(contentsOf: contentsOf)
        
        if contentsOf.count < pageCount {
            self.hasMore = false
        }else{
            self.hasMore = true
        }
    }
}

