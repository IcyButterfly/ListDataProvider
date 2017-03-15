//
//  ReusableView.swift
//  ListDataProvider
//
//  Created by 郑林琴 on 16/9/6.
//  Copyright © 2016年 Ice Butterfly. All rights reserved.
//

import UIKit


/*
 * cell的界面显示类
 * 一个cell多处使用的复用 单独创建一个Binder类or struct
 * write once user everywhere
 */

public protocol ReusableViewBinder {
    associatedtype ViewModel
    func bindWith(_ viewModel: ViewModel)
}

// MARK: - ReusableView
public protocol ReusableView: class {
    static var identifier: String {get}
}

extension ReusableView where Self: UIView{
    public static var identifier: String{
        get{
            return String(describing: self)
        }
    }
}


extension UITableViewCell: ReusableView{}

extension UITableViewHeaderFooterView: ReusableView{}

extension UICollectionReusableView: ReusableView{}
