//
//  SectionedArrayContainer.swift
//  ListDataProvider
//
//  Created by ET|冰琳 on 2017/3/10.
//  Copyright © 2017年 UK. All rights reserved.
//

import UIKit

public protocol SectionedArrayContainer {
    associatedtype Data
    var items: [[Data]] { get set }
}

extension SectionedArrayContainer where Self: ListDataProvider {
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
