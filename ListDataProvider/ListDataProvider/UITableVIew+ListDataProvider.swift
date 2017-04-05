//
//  UITableVIew+ListDataProvider.swift
//  TicketSystem
//
//  Created by ET|冰琳 on 2017/3/30.
//  Copyright © 2017年 UK. All rights reserved.
//

import UIKit

extension UITableView {
    
    func buildCell<T: ListDataProvider>(at indexPath: IndexPath, from dataProvider: T) -> UITableViewCell where T.Data == TableCellData {
        
        let data = dataProvider.data(at: indexPath)
        let cell = dequeueReusableCell(withIdentifier: data.identifier)
        
        
        if let cell = cell {
            data.build(tableCell: cell, at: indexPath)
        }
        return cell!
    }
    
    func estimateHeight<T: ListDataProvider>(at indexPath: IndexPath, from dataProvider: T) -> CGFloat where T.Data == TableCellData {
        
        let data = dataProvider.data(at: indexPath)
        
        if let height = data.cellHeight {
            return height
        }
        return UITableViewAutomaticDimension
    }
    
    func doSelect<T: ListDataProvider>(at indexPath: IndexPath, in dataProvider: T) where T.Data == TableCellData {
        let data = dataProvider.data(at: indexPath)
        data.select(indexPath: indexPath)
    }
}
