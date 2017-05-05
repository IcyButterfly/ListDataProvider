

//
//  TableViewProxy.swift
//  ListDataProvider
//
//  Created by 郑林琴 on 16/9/1.
//  Copyright © 2016年 Ice Butterfly. All rights reserved.
//

import UIKit


protocol TableViewCellIdentifierDelegate {
    func identifierForCellAt(indexPath: IndexPath) -> String
}

public class TableViewProxy<DataProvider: ListDataProvider, Cell:UITableViewCell>: NSObject , UITableViewDataSource, UITableViewDelegate
where  Cell: ReusableViewBinder, DataProvider: ListCellViewModelProvider, Cell.ViewModel == DataProvider.CellModel {
    
    public typealias ItemSelect = ((DataProvider.Data, IndexPath) -> Void)
    
    private var dataProvider: DataProvider
    private var identifier: String
    private var cacheHeight: Bool
    
    private var selectAction: ItemSelect?
    var cellIdentifierDelegate: TableViewCellIdentifierDelegate?
    
    deinit{
        print("TableViewProxy deinit")
    }
    
    init(identifier: String = String(describing: Cell.self), cacheHeight: Bool = false, listDataProvider: DataProvider){
        self.identifier   = identifier
        self.cacheHeight  = cacheHeight
        self.dataProvider = listDataProvider
    }
    
    public func setSelectAction(action: @escaping ItemSelect){
        self.selectAction = action
    }

    // MARK: - UITableViewDataSource
    public func numberOfSections(in tableView: UITableView) -> Int {
        return self.dataProvider.sectionCount()
    }

    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataProvider.rowCount(at: section)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cellIdentifier = self.identifier
        if let identifierDelegate = self.cellIdentifierDelegate {
            cellIdentifier = identifierDelegate.identifierForCellAt(indexPath: indexPath)
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! Cell
        cell.bindWith(self.dataProvider.viewModel(at: indexPath))
        
        return cell
    }
    
    // MARK: - UITableViewDelegate
    public func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.estimatedRowHeight
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let select = self.selectAction {
            let data = self.dataProvider.data(at: indexPath)
            select(data, indexPath)
        }
    }
    
    // MARK: -
    public func manageCellOf(tableView: UITableView){
        tableView.queueIn(cell: Cell.self, identifier: self.identifier)
    }
}

