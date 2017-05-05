//
//  PlainTextHeaderFooterView.swift
//  ListDataProvider
//
//  Created by ET|冰琳 on 2017/3/15.
//  Copyright © 2017年 Ice Butterfly. All rights reserved.
//

import UIKit

class PlainTextHeaderFooterView: UITableViewHeaderFooterView {
    
    @IBInspectable var textLeft: CGFloat = LDPTableViewCell.defaultLeftEdge
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if var frame = textLabel?.frame {
            frame.origin.x = self.textLeft
            textLabel?.frame = frame
        }
    }
}
