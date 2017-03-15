//
//  TextLeftTableViewCell.swift
//  ListDataProvider
//
//  Created by ET|冰琳 on 2017/3/15.
//  Copyright © 2017年 Ice Butterfly. All rights reserved.
//

import UIKit

class TextLeftTableViewCell: UITableViewCell {

    @IBInspectable var leftEdge: CGFloat = 10
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if var frame = self.textLabel?.frame {
            frame.origin.x = self.leftEdge
            self.textLabel?.frame = frame
        }
    }
}
