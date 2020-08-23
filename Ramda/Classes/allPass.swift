//
//  allPass.swift
//  RamdaSwift
//
//  Created by Tonny on 22/08/20.
//

import Foundation


extension Ramda {
    
    static func allPass<A>(_ a: [(A) -> Bool]) -> (A) -> Bool {
        { b in
            a.allSatisfy { $0(b) }
        }
    }
}
