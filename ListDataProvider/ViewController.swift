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


/*
class ViewController: BaseTableViewController, ListDataProvider, ArrayContainer{
    
    var items: [ListEntity] = []
    
    var proxy: TableViewProxy<ViewController, ListCell>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let classString = NSStringFromClass(TestViewController.self)
        let classString = NSStringFromClass(TestViewController.classForCoder())
        let vcClass = NSClassFromString(classString) as! UIViewController.Type
        let viewController = vcClass.init()
        
        
        self.items.append(ListEntity(title: "list with a type cell", class: SingleCellViewController.self))
        self.items.append(ListEntity(title: "list with a type cell, section a row", class: SingleCellViewController.self))
        
        self.items.append(ListEntity(title: "list with sections", class: SectionedTableViewController.self))
        
        self.items.append(ListEntity(title: "list with multiple cells", class: MultipeerTableViewController.self))
        
        self.proxy = TableViewProxy<ViewController, ListCell>(listDataProvider: self)
        self.tableView.dataSource = self.proxy
        self.tableView.delegate   = self.proxy
        
        self.proxy.manageCellOf(self.tableView)
        self.proxy.setSelectAction { (entity, indexPath) in
            let vcType = entity.`class` as? UIViewController.Type
            if let vcType = vcType{
                let vc = vcType.init()
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }

}

class TestViewController: UIViewController {
    
}
*/
