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
    
    override public func respondsToSelector(aSelector: Selector) -> Bool {
        
        if self.delegateForward?.respondsToSelector(aSelector) == true{
            return true
        }
        return super.respondsToSelector(aSelector)
    }
    
    override public func forwardingTargetForSelector(aSelector: Selector) -> AnyObject? {
        if self.delegateForward?.respondsToSelector(aSelector) == true{
            return self.delegateForward
        }
        return super.forwardingTargetForSelector(aSelector)
    }
}