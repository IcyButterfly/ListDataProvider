//
//  LDPTableViewCell.swift
//  ListDataProvider
//
//  Created by ET|冰琳 on 2017/3/20.
//  Copyright © 2017年 Ice Butterfly. All rights reserved.
//

import UIKit

class LDPTableViewCell: UITableViewCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    func setup() {
        
    }
}
