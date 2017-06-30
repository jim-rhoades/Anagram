//
//  AnagramTests.swift
//  AnagramTests
//
//  Created by Jim Rhoades on 6/30/17.
//  Copyright © 2017 Jim Rhoades. All rights reserved.
//

import XCTest

class AnagramTests: XCTestCase {
	
	let test1 = (string1: "cinema", string2: "ice man") // true
	let test2 = (string1: "Cinema", string2: "ice man") // true
	let test3 = (string1: "schoolmaster", string2: "theclassroom") // true
	let test4 = (string1: "William Shakespeare", string2: "I am a weakish speller") // true
	let test5 = (string1: "cinemma", string2: "ice man") // false
	
	let ats = anagramTestStrings(length: 2000000)
	
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
	
	func testVersion1() {
		XCTAssert(isAnagramV1(string1: test1.string1, string2: test1.string2))
		XCTAssert(isAnagramV1(string1: test2.string1, string2: test2.string2))
		XCTAssert(isAnagramV1(string1: test3.string1, string2: test3.string2))
		XCTAssert(isAnagramV1(string1: test4.string1, string2: test4.string2))
		XCTAssert(!isAnagramV1(string1: test5.string1, string2: test5.string2))
	}
	
	func testVersion2() {
		XCTAssert(isAnagramV2(string1: test1.string1, string2: test1.string2))
		XCTAssert(isAnagramV2(string1: test2.string1, string2: test2.string2))
		XCTAssert(isAnagramV2(string1: test3.string1, string2: test3.string2))
		XCTAssert(isAnagramV2(string1: test4.string1, string2: test4.string2))
		XCTAssert(!isAnagramV2(string1: test5.string1, string2: test5.string2))
	}
	
	func testVersion3() {
		XCTAssert(isAnagramV3(string1: test1.string1, string2: test1.string2))
		XCTAssert(isAnagramV3(string1: test2.string1, string2: test2.string2))
		XCTAssert(isAnagramV3(string1: test3.string1, string2: test3.string2))
		XCTAssert(isAnagramV3(string1: test4.string1, string2: test4.string2))
		XCTAssert(!isAnagramV3(string1: test5.string1, string2: test5.string2))
	}
	
	func testVersion4() {
		XCTAssert(isAnagramV4(string1: test1.string1, string2: test1.string2))
		XCTAssert(isAnagramV4(string1: test2.string1, string2: test2.string2))
		XCTAssert(isAnagramV4(string1: test3.string1, string2: test3.string2))
		XCTAssert(isAnagramV4(string1: test4.string1, string2: test4.string2))
		XCTAssert(!isAnagramV4(string1: test5.string1, string2: test5.string2))
	}
	
	func testVersion5() {
		XCTAssert(isAnagramV5(string1: test1.string1, string2: test1.string2))
		XCTAssert(isAnagramV5(string1: test2.string1, string2: test2.string2))
		XCTAssert(isAnagramV5(string1: test3.string1, string2: test3.string2))
		XCTAssert(isAnagramV5(string1: test4.string1, string2: test4.string2))
		XCTAssert(!isAnagramV5(string1: test5.string1, string2: test5.string2))
	}
	
	func testVersion6() {
		XCTAssert(isAnagramV6(string1: test1.string1, string2: test1.string2))
		XCTAssert(isAnagramV6(string1: test2.string1, string2: test2.string2))
		XCTAssert(isAnagramV6(string1: test3.string1, string2: test3.string2))
		XCTAssert(isAnagramV6(string1: test4.string1, string2: test4.string2))
		XCTAssert(!isAnagramV6(string1: test5.string1, string2: test5.string2))
	}
	
	
	// TODO: figure out how to test performance using release build instead of debug
	/*
	func testPerformanceVersion1() {
		self.measure {
			_ = isAnagramV1(string1: self.ats.s1, string2: self.ats.s2)
		}
	}
	
	func testPerformanceVersion2() {
		self.measure {
			_ = isAnagramV2(string1: self.ats.s1, string2: self.ats.s2)
		}
	}
	*/
}
