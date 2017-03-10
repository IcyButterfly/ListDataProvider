//
//  ArrayContainer.swift
//  ListDataProvider
//
//  Created by ET|冰琳 on 2017/3/10.
//  Copyright © 2017年 UK. All rights reserved.
//

import UIKit

protocol Singled { }
protocol Sectioned { }

public protocol ArrayContainer {
    associatedtype Data
    var items: [Data] { get set }
}

extension ArrayContainer {
    
    public mutating func append(newElement: Data){
        self.items.append(newElement)
    }
    
    public mutating func append(contentOf: [Data]){
        self.items.append(contentsOf: contentOf)
    }
    
    public mutating func append(contentsOf: [Data], more: Bool) {
        if more == false {
            self.items.removeAll()
        }
        self.items.append(contentsOf: contentsOf)
    }
}

extension ArrayContainer where Self: ListDataProvider, Self: Singled {
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
