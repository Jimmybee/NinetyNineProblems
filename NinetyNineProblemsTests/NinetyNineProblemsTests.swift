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
    
    func testP06() {
        let palidromeList:List! = List(1, 2, 3, 2, 1)
        XCTAssertTrue(palidromeList.isPalindrome(), "List is a palidrome")
        XCTAssertFalse(list.isPalindrome(), "List is not a palidrome")

    }
    
    func testP07() {
        let listOfList:List! = List<Any>(List<Any>(1, 1), 2, List<Any>(3, List<Any>(5, 8)))
        let flat = listOfList.flatten()
        let element0 = flat[0] as? Int
        let element3 = flat[3] as? Int
        let element5 = flat[5] as? Int
        XCTAssertTrue(element0 == 1, "Flatted list 0th element should equal 1")
        XCTAssertTrue(element3 == 3, "Flatted list 3rd element should equal 3")
        XCTAssertTrue(element5 == 8, "Flatted list 5th element should equal 8")

    }
    
    func testP08() {
        let list:List! = List("a", "a", "a", "a", "b", "c", "c", "a", "a", "d", "e", "e", "e", "e")
        let intendedCompression:List! = List("a", "b", "c", "a", "d", "e")
        list.compress()
        listsMatch(list1: list, list2: intendedCompression)
    }
    
    func testP09() {
        let list:List! = List("a", "a", "a", "a", "b", "c", "c", "a", "a", "d", "e", "e", "e", "e")
        let expectedResult:List! = List(List("a", "a", "a", "a"), List("b"), List("c", "c"), List("a", "a"), List("d"), List("e", "e", "e", "e"))
        let packededList = list.pack()
        XCTAssertEqual(expectedResult.length, packededList.length)
        XCTAssertEqual(expectedResult[0]!?.length, packededList[0]?.length)
        XCTAssertEqual(expectedResult[1]!?.length, packededList[1]?.length)
        XCTAssertEqual(expectedResult[1]!?.last, packededList[1]?.last)
        XCTAssertEqual(expectedResult.last!?.length, packededList.last?.length)
        XCTAssertEqual(expectedResult.last!?.last, packededList.last?.last)

    }
    
    func testP10() {
        let list:List! = List("a", "a", "a", "a", "b", "c", "c", "a", "a", "d", "e", "e", "e", "e")
        let expectedResult:List! = List((4, "a"), (1, "b"), (2, "c"), (2, "a"), (1, "d"), (4, "e"))
        let encodedList = list.encode()
        print(encodedList)
        XCTAssertEqual(expectedResult.length, encodedList.length)
    }
    
    func listsMatch<T>(list1: List<T>, list2: List<T>) where T: Equatable{
        XCTAssertTrue(list1.length == list2.length)
        for index in 0...(list1.length - 1) {
            XCTAssertTrue(list1[index]! == list2[index]!, "Lists don't match")
        }
    }
}
