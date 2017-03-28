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

struct PagedListDataProviderDefault {
    static var pageIndex: Int = 1
    static var pageSize:  Int = 10
}

extension PagedListDataProvider where Self: ArrayContainer{
    

    public func isEmpty() -> Bool {
        return self.items.count == 0
    }

    /// 计算页码
    ///
    /// - Parameters:
    ///   - count: 每页个数
    ///   - more:  是否是加载更多
    ///   - startIndex: 起始页码的数量 默认值为1
    /// - Returns: more true:  加载更多的页数
    ///                 false: 刷新时的页数
    
    public func pageIndex(withPageCount count: Int = PagedListDataProviderDefault.pageSize,
                          isRequestMore more: Bool,
                          startIndex: Int = PagedListDataProviderDefault.pageIndex) -> Int{
        if more == false{
            return startIndex
        }
        let total = self.items.count
        return Int( ceil( Double(total) / Double(count))) + startIndex
    }
    
    
    /// 通过接口返回的数据的数量判断是否还有更多
    ///
    /// eg: pageCount为10
    ///     contentsOf的count为1  则可以判断没有更多了
    ///     contentsOf的count为10 则可能是还有更多 也可能是没有更多了，此时 本方法判断结果为还有更多
    ///                          此时如果服务器并未给出是否还有更多的字段，则可以通过再获取一页来判断,直到获取到的数量小于10 就没有更多了
    public func append(contentsOf: [Data],
                       isRequestMore more: Bool,
                       pageCount: Int = PagedListDataProviderDefault.pageSize) {
        
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
    
    
    /// 接口有返回的是否还有更多
    ///
    /// - Parameters:
    ///   - hasMore: API返回的是否还有更多
    public func append(contentsOf: [Data], isRequestMore more: Bool, hasMore: Bool) {
        if more == false {
            self.items.removeAll()
        }
        self.items.append(contentsOf: contentsOf)
        self.hasMore = hasMore
    }
}
