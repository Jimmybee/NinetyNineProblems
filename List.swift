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
    
    init() {
        
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

// P06
extension List where T:Equatable {
    func isPalindrome() -> Bool {
        let subscriptLength = self.length - 1
        return checkPair(head: self, length: subscriptLength, valid: true)
    }
    
    func checkPair(head: List<T>?, length: Int, valid: Bool) -> Bool {
        if head?[length] == nil {
            return valid
        } else {
            return checkPair(head: head?.next, length: length - 2, valid: valid) && head!.value ==  head![length]! && valid
        }
    }
}


// P07

extension List {
    
    func flatten() -> List {
         _ = self.recursiveFlatten()
         return self
    }
    
    private func recursiveFlatten() -> List<T>? {
        if let subList = value as? List<T> {
            let lastItemInSublist = subList.recursiveFlatten()
            self.value = subList[0]
            lastItemInSublist?.next = self.next
            next = subList.next
        }
        
        if next != nil {
            return next!.recursiveFlatten()
        } else {
            return self
        }
    }
    
}

// P08
extension List where T: Equatable {
    func compress() {
        next = removedDuplicate(value)
        next?.compress()
    }
    
    private func removedDuplicate(_ ofValue: T) -> List<T>? {
        if value == ofValue {
            return next?.removedDuplicate(ofValue)
        } else {
            return self
        }
    }
}

// P09
extension List where T: Equatable {
    func pack() -> List<List<T>> {
        let duplicates = repeatedCountAndLast(value, count: 0)
        let count = duplicates.0
        let sublistLast = duplicates.1
        let array = Array(repeating: value!, count: count)
        let valueList: List<T>? = List.init(array)
        
        let list = List<List<T>>()
        list.value = valueList
        let nextPacked = sublistLast?.pack()
        list.next = nextPacked
        return list
    }
    
    private func repeatedCountAndLast(_ ofValue: T, count: Int) -> (Int, List<T>?) {
        if value == ofValue {
            if next != nil {
                return next!.repeatedCountAndLast(ofValue, count: count + 1)
            } else {
                return (count + 1, nil)
            }
        } else {
            return (count, self)
        }
    }
}




