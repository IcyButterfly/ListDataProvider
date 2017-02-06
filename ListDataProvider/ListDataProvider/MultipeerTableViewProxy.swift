//
//  MultipeerTableViewProxy.swift
//  TicketSystem
//
//  Created by ET|冰琳 on 2017/1/24.
//  Copyright © 2017年 UK. All rights reserved.
//

import UIKit

class MultipeerTableViewProxy<T: ListDataProvider>: NSObject {
    
    let dataProvider: T
    
    init(dataProvider: T) {
        self.dataProvider = dataProvider
    }
}

// TODO

