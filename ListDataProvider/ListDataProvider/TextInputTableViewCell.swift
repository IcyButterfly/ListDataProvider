//
//  TextInputTableViewCell.swift
//  ListDataProvider
//
//  Created by ET|冰琳 on 2017/3/15.
//  Copyright © 2017年 Ice Butterfly. All rights reserved.
//

import UIKit

class TextInputTableViewCell: LDPTableViewCell {
    
    @IBInspectable var leftEdge: CGFloat = LDPTableViewCell.defaultLeftEdge
    @IBInspectable var rightEdge: CGFloat = 15
    @IBOutlet var inputField: UITextField!
    
    override func setup() {
        if self.inputField != nil { return }
        self.inputField = UITextField()
        self.contentView.addSubview(self.inputField)
        self.inputField.textAlignment = .right
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if var frame = self.textLabel?.frame {
            frame.origin.x = self.leftEdge
            self.textLabel?.frame = frame
        }
        
        if let size = self.textLabel?.sizeThatFits(self.frame.size) {
            var frame = self.inputField.frame
            frame.origin.x = size.width + 10 + self.leftEdge
            frame.origin.y = 0
            frame.size.width = self.frame.width - self.rightEdge - self.leftEdge - size.width - 10
            frame.size.height = self.frame.height
            self.inputField.frame = frame
        }
    }
}
