//
//  UITableViewCell+BIExtension.swift
//  TicketSystem
//
//  Created by ET|冰琳 on 2017/3/30.
//  Copyright © 2017年 UK. All rights reserved.
//

import UIKit

extension UITableViewCell {
    
    func setSeperatorNone() {
        self.separatorInset = UIEdgeInsetsMake(0, UIScreen.main.bounds.width, 0, 0)
    }
    
    func setSeperatorFull() {
        self.separatorInset = .zero
    }
}
