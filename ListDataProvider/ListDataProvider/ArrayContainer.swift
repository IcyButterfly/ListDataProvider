//
//  ArrayContainer.swift
//  ListDataProvider
//
//  Created by 郑林琴 on 16/9/1.
//  Copyright © 2016年 Ice Butterfly. All rights reserved.
//

import UIKit

public protocol Singled { }
public protocol Sectioned { }

public protocol ArrayContainer: class {
    associatedtype Data
    var items: [Data] { get set }
}

extension ArrayContainer {
    
    public func append(newElement: Data){
        self.items.append(newElement)
    }
    
    public func append(contentOf: [Data]){
        self.items.append(contentsOf: contentOf)
    }
    
    public func append(contentsOf: [Data], more: Bool) {
        if more == false {
            self.items.removeAll()
        }
        self.items.append(contentsOf: contentsOf)
    }
}

public extension ArrayContainer where Self: ListDataProvider{
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

extension ArrayContainer where Self: ListDataProvider, Self: Sectioned {
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
