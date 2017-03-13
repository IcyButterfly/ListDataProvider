//
//  MultipeerTableViewProxy.swift
//  TicketSystem
//
//  Created by ET|冰琳 on 2017/1/24.
//  Copyright © 2017年 UK. All rights reserved.
//

import UIKit

class MultipeerTableViewProxy<T: ListDataProvider>: NSObject where T.Data == TableCellData {
    
    let dataProvider: T
    
    init(dataProvider: T) {
        self.dataProvider = dataProvider
    }
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = self.dataProvider.dataAt(indexPath: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: data.identifier)
        return cell!
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.dataProvider.sectionCount()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataProvider.rowCountAt(section: section)
    }
}
