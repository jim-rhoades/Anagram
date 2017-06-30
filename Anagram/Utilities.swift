//
//  Utilities.swift
//  Anagram
//
//  Created by Jim Rhoades on 6/30/17.
//  Copyright © 2017 Jim Rhoades. All rights reserved.
//

import Foundation

func anagramTestStrings(length: Int) -> (s1: String, s2: String) {
	let s1 = String.random(length: length) + "😃"
	var s2 = s1 + "     " // add some spaces
	s2 = s2.shuffle // shuffle the characters
	return (s1, s2)
}

// function for checking the time to execute some code
// via: http://stackoverflow.com/a/25022722/234609
func printTimeElapsedWhenRunningCode(title:String, operation:()->()) {
	let startTime = CFAbsoluteTimeGetCurrent()
	operation()
	let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
	print("Time elapsed for \(title): \(timeElapsed) s")
}

// shuffle an array/string
// via: https://stackoverflow.com/a/27761732/234609
extension Array {
	var shuffled: Array {
		var array = self
		indices.dropLast().forEach {
			guard case let index = Int(arc4random_uniform(UInt32(count - $0))) + $0, index != $0 else { return }
			swap(&array[$0], &array[index])
		}
		return array
	}
}

extension String {
	// shuffle a string
	var shuffle: String {
		return String(Array(characters).shuffled)
	}
	
	// generate a random String
	// via: https://stackoverflow.com/a/26845710/234609
	static func random(length: Int) -> String {
		
		let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
		let len = UInt32(letters.length)
		
		var randomString = ""
		
		for _ in 0 ..< length {
			let rand = arc4random_uniform(len)
			var nextChar = letters.character(at: Int(rand))
			randomString += NSString(characters: &nextChar, length: 1) as String
		}
		
		return randomString
	}
}
