//
//  BaseTableViewController.swift
//  ListDataProvider
//
//  Created by ET|冰琳 on 16/10/8.
//  Copyright © 2016年 Ice Butterfly. All rights reserved.
//

import UIKit

class BaseTableViewController: UIViewController {
    
    var tableView = UITableView(frame: .zero, style: .grouped)

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(self.tableView)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.tableView.frame = self.view.bounds
    }

}
