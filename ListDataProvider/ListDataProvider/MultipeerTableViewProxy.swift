//
//  MultipeerTableViewProxy.swift
//  ListDataProvider
//
//  Created by ET|冰琳 on 16/9/7.
//  Copyright © 2016年 Ice Butterfly. All rights reserved.
//

import UIKit

/*
 * 设置 cell复杂时使用
 */
class MultipeerTableViewProxy : NSObject , UITableViewDataSource, UITableViewDelegate{
    

    let dataProvider : MultipeerSectionedArrayProvider
    
    init(dataProvider: MultipeerSectionedArrayProvider){
        self.dataProvider = dataProvider
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.dataProvider.sectionCount()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataProvider.rowCountAt(section)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let rowItem = self.dataProvider.dataAt(indexPath)
        let cell = tableView.dequeueReusableCellWithIdentifier(rowItem.identifier)!
        rowItem.build(cell, atIndexPath: indexPath)
        return cell
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        let item = self.dataProvider.dataAt(indexPath)
        
        if let height = item.heightAtIndexPath(indexPath) {
            return height
        }
        
        if item.cacheHeight {
            return tableView.fd_heightForCellWithIdentifier(item.identifier, configuration: { (cell) in
                let cell = cell as! UITableViewCell
                item.build(cell, atIndexPath: indexPath)
            })
        }
        
        return tableView.rowHeight
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
}
