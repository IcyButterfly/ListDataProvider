//
//  DelegateProxy.swift
//  ListDataProvider
//
//  Created by ET|冰琳 on 16/9/12.
//  Copyright © 2016年 Ice Butterfly. All rights reserved.
//

import Foundation


public class DelegateProxy : NSObject{
    
    public weak var delegateForward: AnyObject?
    
    override public func responds(to aSelector: Selector) -> Bool {
        
        if self.delegateForward?.responds(to: aSelector) == true{
            return true
        }
        return super.responds(to: aSelector)
    }
    
    public override func forwardingTarget(for aSelector: Selector!) -> Any? {
        if self.delegateForward?.responds(to: aSelector) == true{
            return self.delegateForward
        }
        return super.forwardingTarget(for: aSelector)
    }
}
