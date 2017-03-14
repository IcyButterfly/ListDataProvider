//
//  ArrayContainerSectionedTests.swift
//  ListDataProvider
//
//  Created by ET|冰琳 on 2017/3/14.
//  Copyright © 2017年 Ice Butterfly. All rights reserved.
//

import XCTest
@testable import ListDataProvider
import Nimble
import Quick


class ArrayContainerSectionedDataProvider: NSObject, ListDataProvider, Sectioned, ArrayContainer {
    
    var items: [NSString] = []
}

class ArrayContainerSectionedTests: QuickSpec {
    
    override func spec() {
        
        describe("section just has a row", {
            
            
            context("test section count", {
                
                let provider = ArrayContainerSectionedDataProvider()
                
                it("section count equal to items.count", closure: {
                    expect(provider.sectionCount()).to(equal(provider.items.count))
                    
                    provider.items.append(contentsOf: ["11", "22"])
                    expect(provider.sectionCount()).to(equal(provider.items.count))
                })
                
            })
            

            context("test data at index path", {
                
                let provider = ArrayContainerSectionedDataProvider()
                provider.items.append(contentsOf: ["333", "123"])
                
                it("data at indexPath should be equal items of indexPath.row", closure: {
                    let indexPath = IndexPath(row: 0, section: 1)
                    expect(provider.dataAt(indexPath: indexPath)).to(equal(provider.items[indexPath.section]))
                })
            })
        })
    }
}
