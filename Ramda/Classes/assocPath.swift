//
//  assocPath.swift
//  Ramda
//
//  Created by Tonny on 24/08/20.
//

import Foundation

extension Ramda {
    
    static func assocPath<Key: Hashable>(_ keys: [Key], _ value: Any, _ input: [Key: Any]) -> [Key: Any] {
        guard let key = keys.first else {
            return input
        }
        
        var result = input
        
        let count = keys.count
        
        if let dic = input[key] as? [Key: Any], count > 1 {
            result[key] = assocPath(Array(keys.dropFirst()), value , dic)
        }else if count > 1 {
            result[key] = buildDic(Array(keys.dropFirst()), value)
        }else if count == 1 {
            result[key] = value
        }
        
        return result
    }
    
    private static func buildDic<Key: Hashable>(_ keys: [Key], _ value: Any) -> [Key: Any] {
        guard let last = keys.last else { return [:] }
        
        var result = [last: value]
        
        keys.reversed().dropFirst().forEach { key in
            result = [key: result]
        }
        return result
    }
}
