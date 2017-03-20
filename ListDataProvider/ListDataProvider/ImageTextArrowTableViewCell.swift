//
//  ImageTextArrowTableViewCell.swift
//  ListDataProvider
//
//  Created by ET|冰琳 on 2017/3/15.
//  Copyright © 2017年 Ice Butterfly. All rights reserved.
//

import UIKit

class ImageTextArrowTableViewCell: LDPTableViewCell {

    @IBInspectable var imageLeft: CGFloat = 15
    @IBInspectable var arrowRight: CGFloat = 15
    @IBInspectable var textLeft: CGFloat = 15
    
    var arrow = UIImageView(image: UIImage(named: "arrow_right"))

    override func layoutSubviews() {
        super.layoutSubviews()
        
        var left = self.imageLeft
        
        if var frame = self.imageView?.frame {
            frame.origin.x = left
            left += frame.width
        }
        
        if var frame = self.textLabel?.frame {
            frame.origin.x = left
        }
        
        var arrowframe = self.arrow.frame
        arrowframe.origin.x = self.frame.width - arrowframe.width - self.arrowRight
        arrowframe.origin.y = (self.frame.height - arrowframe.height)/2.0
        self.arrow.frame = arrowframe
    }
    
    override func setup() {
        self.contentView.addSubview(self.arrow)
        self.imageView?.image = UIImage(named: "arrow_right")
    }
}
