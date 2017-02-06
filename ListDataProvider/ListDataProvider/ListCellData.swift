//
//  ListCellData.swift
//  ListDataProvider
//
//  Created by ET|冰琳 on 16/11/9.
//  Copyright © 2016年 UK. All rights reserved.
//

import UIKit

public class ListCellData<Cell>: NSObject {
    
    typealias CellConfiguration = ((Cell, IndexPath) -> Void)
    typealias CellSelection     = ((IndexPath) -> Void)
    typealias CellHeight        = ((IndexPath) -> Float)
    
    let identifier: String?
    let configuration: CellConfiguration?
    let select: CellSelection?
    let height: CellHeight?
    
    init(identifier: String = String(describing: Cell.self),
         configuration: CellConfiguration? = nil,
         selection:     CellSelection? = nil,
         height:        CellHeight?    = nil) {
        
        self.identifier = identifier
        self.configuration = configuration
        self.select = selection
        self.height = height
    }
}
