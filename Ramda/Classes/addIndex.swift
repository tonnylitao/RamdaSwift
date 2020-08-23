//
//  addIndex.swift
//  RamdaSwift
//
//  Created by Tonny on 22/08/20.
//

import Foundation

extension Ramda {
    
    typealias IndexMap<A, B> = (Int, A) -> B
    
    static func addIndex<A, B>(_ f: IndexMap<A, B>, _ list: [A]) -> [B] {
        list.enumerated().map(f)
    }
}

extension Ramda {
    
    static func addIndex<A, B>(_ f: @escaping IndexMap<A, B>) -> ([A]) -> [B] {
        curry(addIndex)(f)
    }
}

extension Ramda {
    
    static func addIndex<A, B>(_ p: Placeholder) -> (@escaping IndexMap<A, B>) -> ([A]) -> [B] {
        curry(addIndex)
    }
    
    static func addIndex<A, B>(_ f: @escaping IndexMap<A, B>, _ p: Placeholder) -> ([A]) -> [B] {
        curry(addIndex)(f)
    }
    
    static func addIndex<A, B>(_ p: Placeholder, _ list: [A]) -> (@escaping IndexMap<A, B>) -> [B] {
        flip(curry(addIndex))(list)
    }
}
