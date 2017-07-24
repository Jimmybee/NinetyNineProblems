//
//  NinetyNineProblemsTests.swift
//  NinetyNineProblemsTests
//
//  Created by James Birtwell on 24/07/2017.
//  Copyright © 2017 JimmyBee. All rights reserved.
//

import XCTest
@testable import NinetyNineProblems

class NinetyNineProblemsTests: XCTestCase {
    let list:List! = List(1, 1, 2, 3, 5, 8)

    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testP01() {
        let last = list.last
        XCTAssertTrue(last == 8, "Last value not 8")
    }
    
    func testP02() {
        let pennultimate = list.pennultimate
        XCTAssertTrue(pennultimate == 5, "pennultimate value not 5")
    }
    
    func testP03() {
        let kthElement = list[2]
        XCTAssertTrue(kthElement == 2, "kthElement value not 2")
    }
    
    func testP04() {
        let length = list.length
        XCTAssertTrue(length == 6, "Length value not 6 but \(length)")
    }
    
    func testP05() {
        let reversedList:List! = list.reversed()
        XCTAssertTrue(reversedList.value == 8, "First value not 8")
        XCTAssertTrue(reversedList.last == 1, "Last value not 1")
    }
}
