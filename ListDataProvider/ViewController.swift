//
//  ViewController.swift
//  ListDataProvider
//
//  Created by 郑林琴 on 16/9/3.
//  Copyright © 2016年 Ice Butterfly. All rights reserved.
//

import UIKit

class TableCellModel: NSObject {
    
}

class TableCell: UITableViewCell, ReusableViewBinder {
    func bindWith(_: TableCellModel) {
        
    }
}

class TableViewProvider: NSObject, ListDataProvider, ArrayContainer {
    
    var items: [TableCellModel] = []
    
}


class ViewControlleraa: UIViewController {
    
    deinit{
        print("view controller deinit")
    }

    let tableView = UITableView()

    let dataProvider = TableViewProvider()
    var proxy : TableViewProxy<TableViewProvider, TableCell>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.proxy =  TableViewProxy
//        
//        proxy.manage(self.tableView)
        
    }

}



class ViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        let viewc = ViewControlleraa()
        print(viewc.view)
        
        
//        self.view.addSubview(viewc.view)
//        self.addChildViewController(viewc)
//
//        let viewc1 = ViewControlleraa()
//        print(viewc1.view)
    }
}