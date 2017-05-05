//
//  ImageTextArrowTableViewCell.swift
//  ListDataProvider
//
//  Created by ET|冰琳 on 2017/3/15.
//  Copyright © 2017年 Ice Butterfly. All rights reserved.
//

import UIKit

class ImageTextArrowTableViewCell: LDPTableViewCell {

    @IBInspectable var imageLeft: CGFloat = LDPTableViewCell.defaultLeftEdge
    @IBInspectable var arrowRight: CGFloat = 15
    @IBInspectable var textLeft: CGFloat = 10
    
    var arrow = UIImageView(image: UIImage(named: "ListDataProvider.bundle/list_right_arrow"))

    override func layoutSubviews() {
        super.layoutSubviews()
        
        var left = imageLeft
        
        imageView?.sizeToFit()
        
        if var frame = imageView?.frame, frame.width > 0.01{
            frame.origin.x = left
            imageView?.frame = frame
            left += frame.width + self.textLeft
        }else if self.textLeft < self.imageLeft{
            left = self.imageLeft
        }else {
            left = self.textLeft
        }
        
        if var frame = textLabel?.frame {
            frame.origin.x = left
            textLabel?.frame = frame
        }
        
        arrow.sizeToFit()
        var arrowframe = arrow.frame
        arrowframe.origin.x = frame.width - arrowframe.width - arrowRight
        arrowframe.origin.y = (frame.height - arrowframe.height)/2.0
        arrow.frame = arrowframe
    }
    
    override func setup() {
        self.contentView.addSubview(self.arrow)
        self.imageView?.image = UIImage(named: "ListDataProvider.bundle/list_right_arrow")
    }
}
