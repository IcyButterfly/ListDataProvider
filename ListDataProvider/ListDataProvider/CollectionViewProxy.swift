//
//  CollectionViewProxy.swift
//  ListDataProvider
//
//  Created by 郑林琴 on 16/9/6.
//  Copyright © 2016年 Ice Butterfly. All rights reserved.
//

import UIKit



/**
 a implement of UICollectionViewDataSource
 default cell identifier is String(Cell)
 */
class CollectionViewProxy<DataProvider: ListDataProvider, Cell:UICollectionViewCell where  Cell: ReusableViewBinder, DataProvider.Data == Cell.ViewModel>: NSObject , UICollectionViewDataSource{
    
    private var dataProvider: DataProvider
    private var identifier: String
    
    init(identifier: String = String(Cell), listDataProvider: DataProvider){
        self.identifier   = identifier
        self.dataProvider = listDataProvider
    }
    
    // MARK: - UICollectionViewDataSource
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return self.dataProvider.sectionCount()
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataProvider.rowCountAt(section)
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(self.identifier, forIndexPath: indexPath)
        let actualCell = cell as! Cell
        actualCell.bindWith(self.dataProvider.dataAt(indexPath))
        return actualCell
    }
}
