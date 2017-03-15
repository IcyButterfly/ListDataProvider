//
//  UITableView+BIDequeCell.swift
//  MiaoleGB
//
//  Created by ET|冰琳 on 16/2/24.
//  Copyright © 2016年 UOKO. All rights reserved.
//

import UIKit

extension UITableView: ListView{
    
    // in
    public func queueIn(cell: AnyClass){
        self.queueIn(cell: cell, identifier: String(describing: cell))
    }
    
    public func queueIn(cell: AnyClass, identifier: String){
        
        let cellString = String(describing: cell)
        
        if let _ = Bundle.main.path(forResource: cellString, ofType: "nib") {
            self.register(UINib(nibName: cellString, bundle: nil), forCellReuseIdentifier: identifier)
        }else{
            self.register(cell, forCellReuseIdentifier: identifier)
        }
    }
    
    // out
    public func queueOutCell<T>(identifier: String, for indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withIdentifier: identifier) as! T
    }
    
    public func queueOutCell<T: ReusableView>(for indexPath: IndexPath) -> T {
        print(String(describing: T.self))
        return self.dequeueReusableCell(withIdentifier: String(describing: T.self)) as! T
    }
}
