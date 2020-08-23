//
//  always.swift
//  RamdaSwift
//
//  Created by Tonny on 22/08/20.
//

import Foundation

extension Ramda {
    
    static func always<T>(_ a: T) -> (Any) -> T {
        { _ in
            a
        }
    }
    
    static func always<T>(_ a: T) -> () -> T {
        {
            a
        }
    }
}
