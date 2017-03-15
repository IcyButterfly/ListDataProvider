//
//  TextArrowTableViewCell.swift
//  ListDataProvider
//
//  Created by ET|冰琳 on 2017/3/15.
//  Copyright © 2017年 Ice Butterfly. All rights reserved.
//

import UIKit

class TextArrowTableViewCell: UITableViewCell {
    
    var arrow: UIImageView!
    
    @IBInspectable var textLeft: CGFloat = 50
    @IBInspectable var arrowRight: CGFloat = 15

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.arrow = UIImageView(image: UIImage(named: "arrow_right"))
        self.contentView.addSubview(self.arrow)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
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
