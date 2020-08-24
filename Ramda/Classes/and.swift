//
//  and.swift
//  RamdaSwift
//
//  Created by Tonny on 22/08/20.
//

import Foundation

extension Ramda {
    
    static func and(_ a: Bool, _ b: @autoclosure () -> Bool) -> Bool {
        a && b()
    }
}

extension Ramda {
    
    static func and(_ p: Placeholder, _ b: @escaping @autoclosure () -> Bool) -> (Bool) -> Bool {
        { a in
            a && b()
        }
    }
    
    static func and(_ a: Bool, _ p: Placeholder) -> (@autoclosure () -> Bool) -> Bool {
        { b in
            a && b()
        }
    }
}

