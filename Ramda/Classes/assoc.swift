//
//  assoc.swift
//  Ramda
//
//  Created by Tonny on 24/08/20.
//

import Foundation

extension Ramda {
    
    static func assoc<Key: Hashable, Value>(_ key: Key, _ value: Value, _ dic: [Key: Value]) -> [Key: Value] {
        var result = dic
        result[key] = value
        return result
    }
}

extension Ramda {
    
    static func assoc<Key: Hashable, Value>(_ p: Placeholder, _ value: Value, _ dic: [Key: Value]) -> (Key) -> [Key: Value] {
        
        { key in
            assoc(key, value, dic)
        }
    }
    
    static func assoc<Key: Hashable, Value>(_ key: Key, _ p: Placeholder, _ dic: [Key: Value]) -> (Value) -> [Key: Value] {
        
        { value in
            assoc(key, value, dic)
        }
    }
    
    static func assoc<Key: Hashable, Value>(_ key: Key, _ value: Value, _ p: Placeholder) -> ([Key: Value]) -> [Key: Value] {
        
        { dic in
            assoc(key, value, dic)
        }
    }
}

