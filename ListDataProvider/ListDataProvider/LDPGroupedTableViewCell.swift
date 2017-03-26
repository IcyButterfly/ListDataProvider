//
//  LDPGroupedTableViewCell.swift
//  DutyManage
//
//  Created by 郑林琴 on 2017/3/25.
//  Copyright © 2017年 Ice Butterfly. All rights reserved.
//

import UIKit

enum CellPosition {
    case first
    case center
    case last
    
    var corner: UIRectCorner {
        switch self {
        case .first:
            return UIRectCorner.topLeft.union(.topRight)
        case .center:
            return UIRectCorner(rawValue: 0)
        case .last:
            return UIRectCorner.bottomLeft.union(.bottomRight)
        }
    }
}

class LDPGroupedTableViewCell: LDPTableViewCell {
    
    var backgroundLayer = CAShapeLayer()
    var position: CellPosition = .center {
        didSet {
            if position == .last {
                self.separatorInset = UIEdgeInsetsMake(0, 0, 0, UIScreen.main.bounds.width)
            }else{
                self.separatorInset = backLayerEdgeInset
            }
        }
    }
    
    @IBInspectable var backgroundCorner: CGFloat = 5
    @IBInspectable var backLayerEdgeInset = UIEdgeInsetsMake(0, 10, 0, 10)

    override func setup() {

        self.contentView.backgroundColor = UIColor.clear
        self.contentView.layer.insertSublayer(backgroundLayer, at: 0)
        self.backgroundLayer.fillColor = UIColor.white.cgColor
        
        self.separatorInset = UIEdgeInsetsMake(0, backLayerEdgeInset.left + backgroundCorner,
                                               0, backLayerEdgeInset.right)
        self.refreshBackgroundLayer()
        self.selectionStyle = .none
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.refreshBackgroundLayer()
    }
    
    func refreshBackgroundLayer() {
        
        var f = self.bounds
        f.origin.x = backLayerEdgeInset.left
        f.origin.y = backLayerEdgeInset.top
        f.size.width = f.width - backLayerEdgeInset.left - backLayerEdgeInset.right
        f.size.height = f.height - backLayerEdgeInset.top - backLayerEdgeInset.bottom
        
        let bezier = UIBezierPath(roundedRect: f,
                                  byRoundingCorners: self.position.corner,
                                  cornerRadii: CGSize(width: backgroundCorner, height: backgroundCorner))
        self.backgroundLayer.path = bezier.cgPath
    }

    /*
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            self.backgroundLayer.fillColor = UIColor.lightGray.cgColor
        }else {
            self.backgroundLayer.fillColor = UIColor.white.cgColor
        }
    }
    */
}
