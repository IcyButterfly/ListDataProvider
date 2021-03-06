//
//  TextCheckTableViewCell.swift
//  ListDataProvider
//
//  Created by ET|冰琳 on 2017/3/15.
//  Copyright © 2017年 Ice Butterfly. All rights reserved.
//

import UIKit

class TextCheckTableViewCell: LDPTableViewCell {

    @IBOutlet var check: UIImageView!
    @IBInspectable var textLeft: CGFloat = LDPTableViewCell.defaultLeftEdge
    @IBInspectable var checkRight: CGFloat = 15
    
    override func setup() {
        if self.check != nil { return }
    
        let image = UIImage(named: "ListDataProvider.bundle/list_right_check")
        self.check = UIImageView(image: image)
        self.contentView.addSubview(self.check)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if var txtFrame = self.textLabel?.frame {
            
            if txtFrame.origin.x != self.textLeft {
                txtFrame.origin.x = textLeft
                self.textLabel?.frame = txtFrame
            }
        }
        
        check.sizeToFit()
        var checkFrame = check.frame
        checkFrame.origin.x = frame.width - checkRight - checkFrame.width
        checkFrame.origin.y = (frame.height - checkFrame.height)/2.0
        self.check.frame = checkFrame
    }
    
    override var isSelected: Bool {
        didSet {
            DispatchQueue.main.async {
                self.check.isHidden = !self.isSelected
            }
        }
    }

}
