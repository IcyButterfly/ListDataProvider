//
//  TextPlaceholderTableViewCell.swift
//  ListDataProvider
//
//  Created by ET|冰琳 on 2017/3/15.
//  Copyright © 2017年 Ice Butterfly. All rights reserved.
//

import UIKit

class TextPlaceholderTableViewCell: LDPTableViewCell {
    
    lazy var placeholder = UILabel()
    lazy var value = UILabel()
    lazy var left  = UILabel()
    @IBOutlet var arrow: UIImageView!

    @IBInspectable var leftEdge: CGFloat = LDPTableViewCell.defaultLeftEdge
    @IBInspectable var rightEdge: CGFloat = 15

    func set(value: String?) {
        self.value.text = value
        
        if let v = value, v.characters.count > 0 {
            self.placeholder.isHidden = true
        }else{
            self.placeholder.isHidden = false
        }
    }
    
    override func setup() {
        self.contentView.addSubview(self.left)
        self.contentView.addSubview(self.placeholder)
        self.contentView.addSubview(self.value)
        
        self.placeholder.textAlignment = .right
        self.value.textAlignment = .right
        self.placeholder.textColor = UIColor.lightGray
        
        if self.arrow == nil {

            self.arrow = UIImageView(image: UIImage(named: "ListDataProvider.bundle/list_right_arrow.png"))

            self.contentView.addSubview(self.arrow)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.left.sizeToFit()
        var leftFrame = self.left.frame
        leftFrame.origin.x = self.leftEdge
        leftFrame.origin.y = (self.frame.height - leftFrame.height)/2.0
        self.left.frame = leftFrame

        var arrowFrame = arrow.frame
        arrowFrame.origin.x = frame.width - rightEdge - arrowFrame.width
        arrowFrame.origin.y = (frame.height - arrowFrame.height)/2.0
        self.arrow.frame = arrowFrame
        
//        self.placeholder.sizeToFit()
//        var placeholderFrame = self.placeholder.frame
//        placeholderFrame.origin.x = arrowFrame.maxX - arrowFrame.width - placeholderFrame.width - 5/*placeholder-arrow*/
//        placeholderFrame.origin.y = (self.frame.height - placeholderFrame.height)/2.0
//        self.placeholder.frame = placeholderFrame
        
        var valueFrame = self.value.frame
        valueFrame.origin.x = self.left.frame.maxX + self.rightEdge
        valueFrame.origin.y = 0//(self.frame.height - valueFrame.height)/2.0
        valueFrame.size.width = self.frame.width - self.left.frame.maxX - self.rightEdge * 2 - arrowFrame.width - 5/*placeholder-arrow*/
        valueFrame.size.height = self.frame.height
        self.value.frame = valueFrame
        self.placeholder.frame = valueFrame
    }
}
