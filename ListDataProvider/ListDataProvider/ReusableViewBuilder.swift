//
//  ReusableViewBuilder.swift
//  ListDataProvider
//
//  Created by 郑林琴 on 16/9/6.
//  Copyright © 2016年 Ice Butterfly. All rights reserved.
//

import UIKit

// MARK: - ReusableView
public protocol ReusableView{
    static var identifier: String {get}
}

extension ReusableView where Self: UIView{
    public static var identifier: String{
        get{
            return String(self)
        }
    }
}


extension UITableViewCell: ReusableView{}

extension UITableViewHeaderFooterView: ReusableView{}

extension UICollectionReusableView: ReusableView{}



// MARK: - ReusableViewInfo
public protocol ReusableViewInfo {
    var identifier: String { get }
    var cacheHeight: Bool { get }

    func build(cell: UITableViewCell, atIndexPath: NSIndexPath)
    func heightAtIndexPath(indexPath: NSIndexPath) -> CGFloat?
    func didSelectIndexPath(indexPath: NSIndexPath)
}

extension ReusableViewInfo{
    var cacheHeight: Bool {
        return false
    }
}



// MARK: - ReusableViewBuilder
public struct ReusableViewBuilder<T: ReusableView where T : ReusableViewBinder> {
    
    typealias Builder = ((cell: T, data: T.ViewModel, indexPath: NSIndexPath) -> Void)
    typealias Action  = ((data: T.ViewModel, indexPath: NSIndexPath) -> Void)
    typealias Selection  = ((data: T.ViewModel, indexPath: NSIndexPath) -> Void)
    
    public let identifier: String
    private let cellData: T.ViewModel
    private var cellHeight: CGFloat?
    private var cellCalculator: (() -> CGFloat)?
    
    private var cellBuilder: Builder?
    private var cellSelect: Selection?
    
    public var cacheHeight: Bool = false
    
    init(identifier: String = String(T), cellData: T.ViewModel) {
        self.identifier = identifier
        self.cellData   = cellData
    }
    
    func cellBuilder(builder: Builder) -> ReusableViewBuilder{
        var data = self
        data.cellBuilder = builder
        return data
    }
    
    func cellHeight(height: CGFloat) -> ReusableViewBuilder{
        var data = self
        data.cellHeight = height
        return data
    }
    
    func cellCalculator(calculator: () -> CGFloat) -> ReusableViewBuilder{
        var data = self
        data.cellCalculator = calculator
        return data
    }
}



extension ReusableViewBuilder: ReusableViewInfo{
    
    public func build(cell: UITableViewCell, atIndexPath indexPath: NSIndexPath) {
        let view = cell as! T
        view.bindWith(self.cellData)
        if let cellBuilder = self.cellBuilder {
            cellBuilder(cell:view, data: self.cellData, indexPath: indexPath)
        }
    }
    
    public func heightAtIndexPath(indexPath: NSIndexPath) -> CGFloat? {
        if let height = self.cellHeight{
            return height
        }
        if let caculator = self.cellCalculator{
            let height = caculator()
            return height
        }
        return nil
    }
    
    public func didSelectIndexPath(indexPath: NSIndexPath) {
        self.cellSelect?(data: self.cellData, indexPath: indexPath)
    }
}

