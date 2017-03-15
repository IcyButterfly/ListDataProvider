//
//  UICollectionVIew+BIDequeCell.swift
//  TicketSystem
//
//  Created by ET|冰琳 on 2017/2/14.
//  Copyright © 2017年 UK. All rights reserved.
//

import UIKit

extension UICollectionView: ListView {
    
    // in
    public func queueIn(cell: AnyClass) {
        self.queueIn(cell: cell, identifier: String(describing: cell))
    }
    
    public func queueIn(cell: AnyClass, identifier: String) {
        
        let cellString = String(describing: cell)
        
        if let _ = Bundle.main.path(forResource: cellString, ofType: "nib") {
            self.register(UINib(nibName: cellString, bundle: nil), forCellWithReuseIdentifier: identifier)
        }else{
            self.register(cell, forCellWithReuseIdentifier: identifier)
        }
    }
    
    // out
    public func queueOutCell<T>(identifier: String, for indexPath: IndexPath) -> T{
        return self.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! T
    }
    
    public func queueOutCell<T: ReusableView>(for indexPath: IndexPath) -> T{
        return self.dequeueReusableCell(withReuseIdentifier: String(describing: T.self), for: indexPath) as! T
    }
}
