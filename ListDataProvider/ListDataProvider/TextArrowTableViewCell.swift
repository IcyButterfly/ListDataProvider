//
//  TextArrowTableViewCell.swift
//  ListDataProvider
//
//  Created by ET|冰琳 on 2017/3/15.
//  Copyright © 2017年 Ice Butterfly. All rights reserved.
//

import UIKit

class TextArrowTableViewCell: LDPTableViewCell {
    
    @IBOutlet var arrow: UIImageView!
    
    @IBInspectable var textLeft: CGFloat = 15
    @IBInspectable var arrowRight: CGFloat = 15

    override func setup() {
        
        if self.arrow == nil {
            self.arrow = UIImageView(image: UIImage(named: "arrow_right"))
            self.contentView.addSubview(self.arrow)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if var txtFrame = self.textLabel?.frame {
            
            if txtFrame.origin.x != self.textLeft {
                txtFrame.origin.x = textLeft
                self.textLabel?.frame = txtFrame
            }
        }
        
        var arrowFrame = arrow.frame
        arrowFrame.origin.x = frame.width - arrowRight - arrowFrame.width
        arrowFrame.origin.y = (frame.height - arrowFrame.height)/2.0
        self.arrow.frame = arrowFrame
    }

}
