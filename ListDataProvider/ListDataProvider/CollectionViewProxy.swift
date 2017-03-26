//
//  CollectionViewProxy.swift
//  ListDataProvider
//
//  Created by 郑林琴 on 16/9/6.
//  Copyright © 2016年 Ice Butterfly. All rights reserved.
//

import UIKit

class CollectionViewProxy<DataProvider: ListDataProvider, Cell:UICollectionViewCell>: NSObject , UICollectionViewDataSource

where DataProvider: ListCellViewModelProvider, Cell: ReusableViewBinder, DataProvider.CellModel == Cell.ViewModel{
    
    private var dataProvider: DataProvider
    private var identifier: String
    
    init(identifier: String = String(describing: Cell.self), listDataProvider: DataProvider){
        self.identifier   = identifier
        self.dataProvider = listDataProvider
    }
    
    // MARK: - UICollectionViewDataSource
    private func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return self.dataProvider.sectionCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataProvider.rowCountAt(section: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.identifier, for: indexPath)
        let actualCell = cell as! Cell
        actualCell.bindWith(self.dataProvider.viewModel(at: indexPath))
        return actualCell
    }
}
