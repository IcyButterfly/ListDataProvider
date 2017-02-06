//
//  UITableView+BIDequeCell.swift
//  MiaoleGB
//
//  Created by ET|冰琳 on 16/2/24.
//  Copyright © 2016年 UOKO. All rights reserved.
//

import UIKit

extension UITableView{
    
    func queueIn(cell: AnyClass){
        self.queueIn(cell: cell, identifier: String(describing: cell))
    }
    
    func queueIn(cell: AnyClass, identifier: String){
        
        let cellString = String(describing: cell)
        
        if let _ = Bundle.main.path(forResource: cellString, ofType: "nib") {
            self.register(UINib(nibName: cellString, bundle: nil), forCellReuseIdentifier: identifier)
        }else{
            self.register(cell, forCellReuseIdentifier: identifier)
        }
    }
    
    func queueOutCell<T>(identifier: String) -> T{
        return self.dequeueReusableCell(withIdentifier: identifier) as! T
    }
    
    func queueOutCell<T: UITableViewCell>() -> T{
        return self.dequeueReusableCell(withIdentifier: String(describing: T.self)) as! T
    }
    
}
