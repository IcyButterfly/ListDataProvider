//
//  ViewController.swift
//  ListDataProvider
//
//  Created by 郑林琴 on 16/9/3.
//  Copyright © 2016年 Ice Butterfly. All rights reserved.
//

import UIKit


struct ListEntity {
    var title: String
    var `class`: AnyClass
}

class ListCell: UITableViewCell , ReusableViewBinder{
    func bindWith(_ d: ListEntity) {
        self.textLabel?.text = d.title
    }
}


class ViewController: BaseTableViewController, ListDataProvider, ArrayContainer{
    
    var items: [ListEntity] = []
    
    //var proxy: TableViewProxy<ViewController, ListCell>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.items.append(ListEntity(title: "list with a type cell", class: SingleCellViewController.self))
        self.items.append(ListEntity(title: "list with a type cell, section a row", class: SingleCellViewController.self))
        
        self.items.append(ListEntity(title: "list with sections", class: SectionedTableViewController.self))
        
        self.items.append(ListEntity(title: "list with multiple cells", class: MultipeerTableViewController.self))
        
        self.tableView.queueIn(cell: ListCell.self)
        self.tableView.dataSource = self
        self.tableView.delegate   = self
    }

}

extension ViewController: UITableViewDataSource {
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.rowCountAt(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let entity = self.dataAt(indexPath: indexPath)
        let cell: ListCell = tableView.queueOutCell(for: indexPath)
        cell.bindWith(entity)
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let entity = self.dataAt(indexPath: indexPath)
        let vcType = entity.`class` as? UIViewController.Type
        if let vcType = vcType{
            let vc = vcType.init()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
