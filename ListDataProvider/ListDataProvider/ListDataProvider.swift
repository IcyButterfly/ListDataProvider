//
//  ListDataProvider.swift
//  ListDataProvider
//
//  Created by 郑林琴 on 16/9/1.
//  Copyright © 2016年 Ice Butterfly. All rights reserved.
//

import Foundation


public protocol ListDataProvider: class {
    
    associatedtype Data
    
    func sectionCount() -> Int
    func rowCountAt(section: Int) -> Int
    func dataAt(indexPath: IndexPath) -> Data

}
