//
//  ReusableViewBinder.swift
//  ListDataProvider
//
//  Created by 郑林琴 on 16/9/1.
//  Copyright © 2016年 Ice Butterfly. All rights reserved.
//

import UIKit


public protocol ReusableContainerView {
    func reloadData()
    func reloadIndexPaths(indexPaths: [NSIndexPath])
}

extension UITableView: ReusableContainerView {
    public func reloadIndexPaths(indexPaths: [NSIndexPath]){
        self.reloadRowsAtIndexPaths(indexPaths, withRowAnimation: .None)
    }
}

extension UICollectionView: ReusableContainerView {
    public func reloadIndexPaths(indexPaths: [NSIndexPath]){
        self.reloadItemsAtIndexPaths(indexPaths)
    }
}

/*
 * cell的界面显示类
 * 一个cell多处使用的复用 单独创建一个Binder类or struct
 * write once user everywhere
 */

public protocol ReusableViewBinder {
    associatedtype ViewModel
    func bindWith(_: ViewModel)
}

public protocol ReusableViewOperationBinder: ReusableViewBinder {
    func bindOperationWith(_: ViewModel,
                           reusableContainer: ReusableContainerView,
                           indexPath: NSIndexPath,
                           viewController: UIViewController)
}