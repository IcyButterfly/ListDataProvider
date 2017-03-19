//
//  TextPlaceholderTableViewCell.swift
//  ListDataProvider
//
//  Created by ET|冰琳 on 2017/3/15.
//  Copyright © 2017年 Ice Butterfly. All rights reserved.
//

import UIKit

class TextPlaceholderTableViewCell: UITableViewCell {
    
    lazy var placeholder = UILabel()
    lazy var value = UILabel()
    lazy var left  = UILabel()
    
    @IBInspectable var leftEdge: CGFloat = 15
    @IBInspectable var rightEdge: CGFloat = 15

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(self.left)
        self.contentView.addSubview(self.placeholder)
        self.contentView.addSubview(self.value)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.left.sizeToFit()
        var leftFrame = self.left.frame
        leftFrame.origin.x = self.leftEdge
        leftFrame.origin.y = (self.frame.height - leftFrame.height)/2.0
        self.left.frame = leftFrame
        
        self.placeholder.sizeToFit()
        var placeholderFrame = self.placeholder.frame
        placeholderFrame.origin.x = self.frame.width - placeholderFrame.width - self.rightEdge
        placeholderFrame.origin.y = (self.frame.height - placeholderFrame.height)/2.0
        self.placeholder.frame = placeholderFrame
        
        self.value.sizeToFit()
        var valueFrame = self.value.frame
        valueFrame.origin.x = self.frame.width - valueFrame.width - self.rightEdge
        valueFrame.origin.y = (self.frame.height - valueFrame.height)/2.0
        self.value.frame = valueFrame
        
    }
}
