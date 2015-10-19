//
//  Array.swift
//  Noah
//
//  Created by Jirong Wang on 10/12/15.
//  Copyright © 2015 Glow. All rights reserved.
//

import Foundation

public extension Array {
    
    /**
        Converts the array to a dictionary with the keys supplied via the keySelector.
        
        :param: keySelector
        :returns: A dictionary
    */
    public func dictionarize <T> (keySelector: (Element) -> T) -> [T: Element] {
        var result = [T: Element]()
        
        forEach {
            result[keySelector($0)] = $0
        }
        
        return result
    }
    
    
    /**
        Converts the array to a dictionary with keys and values supplied via the transform function.
        
        :param: transform
        :returns: A dictionary
    */
    public func dictionarize <K, V> (transform: (Element) -> (key: K, value: V)?) -> [K: V] {
        var result = [K: V]()
        
        for item in self {
            if let entry = transform(item) {
                result[entry.key] = entry.value
            }
        }
        
        return result
    }
    
}


public extension Array {
    
    /**
        The value for which call(value) is highest.
        :returns: Max value in terms of call(value)
    */
    func maxBy <U: Comparable> (call: (Element) -> (U)) -> Element? {
        guard let firstValue = first else {
            return nil
        }
        
        var maxElement = firstValue
        var maxValue = call(firstValue)
        
        forEach {
            let value = call($0)
            if value > maxValue {
                maxValue = value
                maxElement = $0
            }
        }
        
        return maxElement
    }
    
    
    /**
        The value for which call(value) is lowest.
        :returns: Min value in terms of call(value)
    */
    func minBy <U: Comparable> (call: (Element) -> (U)) -> Element? {
        guard let firstValue = first else {
            return nil
        }
        
        var minElement = firstValue
        var minValue = call(firstValue)
        
        forEach {
            let value = call($0)
            if value < minValue {
                minValue = value
                minElement = $0
            }
        }
        
        return minElement
    }
}





