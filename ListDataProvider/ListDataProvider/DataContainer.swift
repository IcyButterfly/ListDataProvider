//
//  DataContainer.swift
//  ListDataProvider
//
//  Created by 郑林琴 on 16/9/1.
//  Copyright © 2016年 Ice Butterfly. All rights reserved.
//

import UIKit

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



/*
// MARK: -
public class ListArrayProvider<T>:NSObject, ArrayContainer, ListDataProvider{
    public var items: [T] = []
    
    init(datas: [T]){
        self.items = datas
    }
}


public class ListSectionedSingleItemProvider<T>:NSObject, SectionedSingleItemContainer, ListDataProvider{
    
    public typealias Data = T
    public var items: [T] = []
    
    init(datas: [T]){
        self.items = datas
    }
}


public class ListSectionedArrayProvider<T>:NSObject, SectionedArrayContainer, ListDataProvider{
    
    public typealias Data = T
    
    public var items: [[T]] = []
    
    init(datas: [[T]]){
        self.items = datas
    }
}
*/
