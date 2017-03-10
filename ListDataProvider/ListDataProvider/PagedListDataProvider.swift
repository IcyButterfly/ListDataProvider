//
//  PagedListDataProvider.swift
//  ListDataProvider
//
//  Created by ET|冰琳 on 2017/3/10.
//  Copyright © 2017年 UK. All rights reserved.
//

import Foundation

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
