//
//  TableViewProxy.swift
//  ListDataProvider
//
//  Created by 郑林琴 on 16/9/1.
//  Copyright © 2016年 Ice Butterfly. All rights reserved.
//

import UIKit
import UITableView_FDTemplateLayoutCell


protocol TableViewCellIdentifierDelegate {
    func identifierForCellAt(indexPath: NSIndexPath) -> String
}

/**
 a list with single styled cell
 identifier could be more than one
 
 ---
 this class is designed for scene:
 cell height is dynamic , and just need didSelectRowAtIndexPath func 
 
 when @param cacheHeight is false
 tableView.rowHeight will be returned
 
 when didSelectRowAtIndexPath is called selectAction will be executed
 
 ----
 when delegateForward is UITableViewDelegate
 
 when delegateForward implement following will do noting
 tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath)
 func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
 
 ----
 */
public class TableViewProxy<DataProvider: ListDataProvider, Cell:UITableViewCell where  Cell: ReusableViewBinder, DataProvider.Data == Cell.ViewModel>: DelegateProxy , UITableViewDataSource, UITableViewDelegate{
    
    public typealias ItemSelect = ((DataProvider.Data, NSIndexPath) -> Void)
    
    private var dataProvider: DataProvider
    private var identifier: String
    private var cacheHeight: Bool
    
    private var selectAction: ItemSelect?
    var cellIdentifierDelegate: TableViewCellIdentifierDelegate?
    
    deinit{
        print("TableViewProxy deinit")
    }
    
    init(identifier: String = "cell", cacheHeight: Bool = false, listDataProvider: DataProvider){
        self.identifier   = identifier
        self.cacheHeight  = cacheHeight
        self.dataProvider = listDataProvider
    }
    
    public func setSelectAction(action: ItemSelect){
        self.selectAction = action
    }

    // MARK: - UITableViewDataSource
    public func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.dataProvider.sectionCount()
    }
    
    public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataProvider.rowCountAt(section)
    }
    
    public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cellIdentifier = self.identifier
        if let identifierDelegate = self.cellIdentifierDelegate {
            cellIdentifier = identifierDelegate.identifierForCellAt(indexPath)
        }
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! Cell
        cell.bindWith(self.dataProvider.dataAt(indexPath))
        
        return cell
    }
    
    
    // MARK: - UITableViewDelegate
    public func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if self.cacheHeight {
            return tableView.fd_heightForCellWithIdentifier(self.identifier, configuration: { (cellAnyObject) in
                let cell = cellAnyObject as! Cell
                cell.bindWith(self.dataProvider.dataAt(indexPath))
            })
        }
        return tableView.rowHeight
    }
    
    public func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if let select = self.selectAction {
            let data = self.dataProvider.dataAt(indexPath)
            select(data, indexPath)
        }
    }
    
    // MARK: - register cell
    /**
     automatic register Cell with self.identifier 
     the default identifier is "cell"
     */
    
    public func manageCellOf(tableView: UITableView){
        tableView.queueIn(Cell.self, identifier: self.identifier)
    }
}
