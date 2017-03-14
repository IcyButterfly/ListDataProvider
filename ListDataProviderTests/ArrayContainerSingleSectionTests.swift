//
//  ArrayContainerTests.swift
//  ListDataProvider
//
//  Created by ET|冰琳 on 2017/3/14.
//  Copyright © 2017年 Ice Butterfly. All rights reserved.
//

import XCTest
@testable import ListDataProvider
import Nimble
import Quick

class SingleSectionDataProvider: NSObject, ListDataProvider, ArrayContainer {
    var items: [String] = []
}


class ArrayContainerSingleSectionTests: QuickSpec {
    
    override func spec() {
        
        // Judge one section
        describe("just one section", {
            
            
            context("test section count", { 
                
                let provider = SingleSectionDataProvider()
                
                it("zero count of items, section count should be zero", closure: {
                    expect(provider.sectionCount()).to(equal(0))
                })
                
                it("provider has items section count should be 1", closure: {
                    provider.append(contentOf: ["1", "2"])
                    expect(provider.sectionCount()).to(equal(1))
                })
            })
            
            
            context("test row count", { 
                
                let provider = SingleSectionDataProvider()
                
                it("zero count of items, row count should be 0", closure: {
                    expect(provider.rowCountAt(section: 0)).to(equal(0))
                })
                
                it("row count should be equal items.count", closure: { 
                    provider.append(contentOf: ["2", "2"])
                    expect(provider.rowCountAt(section: 0)).to(equal(provider.items.count))
                })
            })
            
            
            context("test data at indexpath", {
                
                let provider = SingleSectionDataProvider()
                provider.items.append(contentsOf: ["333", "123"])
                
                it("data at indexPath should be equal items of indexPath.row", closure: {
                    let indexPath = IndexPath(row: 1, section: 0)
                    expect(provider.dataAt(indexPath: indexPath)).to(equal(provider.items[indexPath.row]))
                })
            })
        })
    }
}
