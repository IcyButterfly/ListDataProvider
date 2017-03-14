//
//  SingleCellViewController.swift
//  ListDataProvider
//
//  Created by ET|冰琳 on 16/10/8.
//  Copyright © 2016年 Ice Butterfly. All rights reserved.
//

import UIKit

class SingleCellViewController: BaseTableViewController {

//    var tableProxy: TableViewProxy<SingleCellViewModel, UITableViewCell>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.tableProxy = TableViewProxy
    }
}

class SingleCellViewModel: NSObject, ListDataProvider, ArrayContainer {
    var items: [String] = []
}



class SingleCellASectionViewController: BaseTableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
}
