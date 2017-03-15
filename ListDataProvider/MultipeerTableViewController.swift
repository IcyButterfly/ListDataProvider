//
//  MultipeerTableViewController.swift
//  ListDataProvider
//
//  Created by ET|冰琳 on 16/10/8.
//  Copyright © 2016年 Ice Butterfly. All rights reserved.
//

import UIKit

class MultipeerTableViewController: BaseTableViewController, ListDataProvider, ArrayContainer {
    
    var items: [TableCellData] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        //
        let text = ListCellData<TextLeftTableViewCell>(configuration: { (cell, index) in
            cell.textLabel?.text = "TextLeft"
        }, selection: nil, height: nil)
        self.items.append(text)
        
        //
        let center = ListCellData<TextCenterTableViewCell>(configuration: { (cell, index) in
            cell.textLabel?.text = "TextCenter"
        }, selection: nil, height: nil)
        self.items.append(center)
        
        //
        let leftArrow = ListCellData<TextArrowTableViewCell>(configuration: { (cell, item) in
            cell.textLabel?.text = "TextArrow"
        }, selection: nil, height: nil)
        self.items.append(leftArrow)
        
        //
        let leftCheck = ListCellData<TextCheckTableViewCell>(configuration: { (cell, item) in
            cell.textLabel?.text = "TextCheck"
        }, selection: nil, height: nil)
        self.items.append(leftCheck)
        
        //
        let textInput = ListCellData<TextInputTableViewCell>(configuration: { (cell, item) in
            cell.textLabel?.text = "TextInput"
        }, selection: nil, height: nil)
        self.items.append(textInput)
        
        //
        let textPlaceholder = ListCellData<TextPlaceholderTableViewCell>(configuration: { (cell, item) in
            cell.textLabel?.text = "TextPlaceholder"
        }, selection: nil, height: nil)
        self.items.append(textPlaceholder)
        
        //
        let imageTxtArrow = ListCellData<ImageTextArrowTableViewCell>(configuration: { (cell, item) in
            cell.textLabel?.text = "ImageTextArrow"
        }, selection: nil, height: nil)
        self.items.append(imageTxtArrow)
        
        
        for item in self.items {
            item.registerTo(tableView: self.tableView)
        }
        
        self.tableView.dataSource = self
        self.tableView.delegate   = self
    }

}

extension MultipeerTableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.rowCountAt(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = self.dataAt(indexPath: indexPath)
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: item.identifier)!
        item.build(tableCell: cell, at: indexPath)
        return cell
    }
}

extension MultipeerTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
