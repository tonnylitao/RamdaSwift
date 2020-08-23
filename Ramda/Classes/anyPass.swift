//
//  anyPass.swift
//  RamdaSwift
//
//  Created by Tonny on 23/08/20.
//

import Foundation


extension Ramda {
    
    static func anyPass<A>(_ a: [(A) -> Bool]) -> (A) -> Bool {
        { b in
            a.first(where: { $0(b) } ) != nil
        }
    }
}
