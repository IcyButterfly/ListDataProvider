

//
//  TableViewProxy.swift
//  ListDataProvider
//
//  Created by 郑林琴 on 16/9/1.
//  Copyright © 2016年 Ice Butterfly. All rights reserved.
//

import UIKit
//import UITableView_FDTemplateLayoutCell

/*
protocol TableViewCellIdentifierDelegate {
    func identifierForCellAt(indexPath: IndexPath) -> String
}

public class TableViewProxy<DataProvider: ListDataProvider, Cell:UITableViewCell>: DelegateProxy , UITableViewDataSource, UITableViewDelegate
where  Cell: ReusableViewBinder, DataProvider.CellViewModel == Cell.ViewModel, DataProvider: ListCellViewModelProvider{
    
    public typealias ItemSelect = ((DataProvider.Data, IndexPath) -> Void)
    
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
    
    public func setSelectAction(action: @escaping ItemSelect){
        self.selectAction = action
    }

    // MARK: - UITableViewDataSource
    public func numberOfSections(in tableView: UITableView) -> Int {
        return self.dataProvider.sectionCount()
    }

    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataProvider.rowCountAt(section: section)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cellIdentifier = self.identifier
        if let identifierDelegate = self.cellIdentifierDelegate {
            cellIdentifier = identifierDelegate.identifierForCellAt(indexPath: indexPath)
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! Cell
        cell.bindWith(self.dataProvider.viewModelAt(indexPath: indexPath))
        
        return cell
    }
    
    
    // MARK: - UITableViewDelegate
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if self.cacheHeight {
            return tableView.fd_heightForCell(withIdentifier: self.identifier, configuration: { (cellAnyObject) in
                let cell = cellAnyObject as! Cell
                cell.bindWith(self.dataProvider.viewModelAt(indexPath: indexPath))
            })
        }
        return tableView.rowHeight
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let select = self.selectAction {
            let data = self.dataProvider.dataAt(indexPath: indexPath)
            select(data, indexPath)
        }
    }
    
    // MARK: -
    public func manageCellOf(tableView: UITableView){
        tableView.queueIn(cell: Cell.self, identifier: self.identifier)
    }
}
*/
