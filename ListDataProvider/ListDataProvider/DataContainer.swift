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

public protocol SectionedArrayContainer {
    associatedtype Data
    var items: [[Data]] { get set }
}

public protocol SectionedSingleItemContainer {
    associatedtype Data
    var items: [Data] { get set }
}

public protocol EntityContainer {
    associatedtype Data
    var entity: Data { get set }
}



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


public class MultipeerArrayProvider: NSObject, ListDataProvider, ArrayContainer{

    public var items: [ReusableViewInfo] = []
    
    //section 0
    func append(item: ReusableViewInfo){
        self.items.append(item)
    }
    
    //section 0
    func append(items: [ReusableViewInfo]){
        self.items.appendContentsOf(items)
    }
    
    func removeAll(){
        self.items.removeAll()
    }
}

public class MultipeerSectionedArrayProvider: NSObject, ListDataProvider, SectionedArrayContainer{
    public typealias Data = ReusableViewInfo
    public var items: [[ReusableViewInfo]] = []
    
    //section 0
    func appendItem(item: ReusableViewInfo){
        if let _ = self.items.first{
            self.items[0].append(item)
        }else{
            self.items = [[item]]
        }
        
    }
    
    //section 0
    func appendItems(items: [ReusableViewInfo]){
        self.items[0].appendContentsOf(items)
    }
    
    //sections
    func appendSection(items: [ReusableViewInfo]) {
        self.items.append(items)
    }
    
    func removeAll(){
        self.items.removeAll()
    }
}