//
//  ListView.swift
//  ListDataProvider
//
//  Created by ET|冰琳 on 2017/3/15.
//  Copyright © 2017年 Ice Butterfly. All rights reserved.
//

import UIKit

public protocol ListView {
    
    // in
    func queueIn(cell: AnyClass)
    func queueIn(cell: AnyClass, identifier: String)
    
    // out
    func queueOutCell<T>(identifier: String, for indexPath: IndexPath) -> T
    func queueOutCell<T: ReusableView>(for indexPath: IndexPath) -> T
}
