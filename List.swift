//
//  List.swift
//  NinetyNineProblems
//
//  Created by James Birtwell on 24/07/2017.
//  Copyright © 2017 JimmyBee. All rights reserved.
//

import Foundation

class List<T>: CustomStringConvertible {
    var value: T!
    var next: List<T>?
    
    public convenience init!(_ values: T...) {
        self.init(Array(values))
    }
    
    init?(_ values: Array<T>) {
        if values.count == 0 {
            return nil
        }
        var nextValues = values
        value = nextValues.removeFirst()
        next = List(nextValues)
    }
}

// P01
extension List {
    var last: T? {
        if next == nil {
            return value
        } else {
            return next?.last
        }
    }
}

// P02
extension List {
    var pennultimate: T? {
        if next?.next == nil {
            return value
        } else {
            return next?.pennultimate
        }
    }
}

// P03
extension List {
    subscript(index: Int) -> T? {
        return index == 0 ? value : next?[index - 1]
    }
}

// P04
extension List {
    var length: Int {
        return next == nil ? 1 : 1 + next!.length
    }
}

// P05
extension List {
    func reversed() -> List<T>? {
        let newHead = recurseiveReverse(self, rest: next)
        self.next = nil
        return newHead
    }
    
    private func recurseiveReverse(_ last: List<T>, rest: List<T>?) -> List<T>? {
        if next == nil {
            next = last
            return self
        } else {
            let newHead = next?.recurseiveReverse(self, rest: next)
            next = last
            return newHead
        }
    }
}


