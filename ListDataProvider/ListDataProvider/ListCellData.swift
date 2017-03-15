//
//  ListCellData.swift
//  ListDataProvider
//
//  Created by ET|冰琳 on 16/11/9.
//  Copyright © 2016年 UK. All rights reserved.
//

import UIKit

public protocol TableCellData{
    
    var identifier: String { get }
    var cellHeight: CGFloat? { get }
    
    func build(tableCell: ReusableView, at indexPath: IndexPath)
    func select(indexPath: IndexPath)
    func registerTo(tableView: ListView) 
}


public class ListCellData<Cell: ReusableView>: NSObject {
    
    typealias CellConfiguration = ((Cell, IndexPath) -> Void)
    typealias CellSelection     = ((IndexPath) -> Void)
    typealias CellHeight        = (() -> CGFloat)
    
    public let identifier: String
    fileprivate let configuration: CellConfiguration?
    fileprivate let select: CellSelection?
    fileprivate let height: CellHeight?
    
    init(identifier: String = String(describing: Cell.self),
         configuration: CellConfiguration? = nil,
         selection:     CellSelection? = nil,
         height:        CellHeight?    = nil) {
        
        self.identifier = identifier
        self.configuration = configuration
        self.select = selection
        self.height = height
    }
    
    public var cellHeight: CGFloat? {
        return self.height?()
    }
}

extension ListCellData: TableCellData {
    
    public func build(tableCell: ReusableView, at indexPath: IndexPath) {
        let cell = tableCell as! Cell
        configuration?(cell, indexPath)
    }
    
    public func select(indexPath: IndexPath) {
        select?(indexPath)
    }
    
    public func registerTo(tableView: ListView) {
        tableView.queueIn(cell: Cell.self, identifier: self.identifier)
    }
}
