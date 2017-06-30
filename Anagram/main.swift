//
//  main.swift
//  Anagram
//
//  Created by Jim Rhoades on 6/29/17.
//  Copyright © 2017 Jim Rhoades. All rights reserved.
//

import Foundation

// VERSION 1
func isAnagramV1(string1: String, string2: String) -> Bool {
	
	// remove any spaces and change to lower case
	let s1 = string1.replacingOccurrences(of: " ", with: "").lowercased()
	let s2 = string2.replacingOccurrences(of: " ", with: "").lowercased()
	
	// compare the strings as sorted arrays
	return s1.characters.sorted() == s2.characters.sorted()
}


// VERSION 2
// similar to version 1, but uses .utf8 instead of .characters
// this is much quicker - since you're sorting numbers instead of characters?
// Also,with this version there is a dramatic improvement in speed in the release build (over the debug build)
func isAnagramV2(string1: String, string2: String) -> Bool {
	
	// remove any spaces and change to lower case
	let s1 = string1.replacingOccurrences(of: " ", with: "").lowercased()
	let s2 = string2.replacingOccurrences(of: " ", with: "").lowercased()
	
	// compare the strings as sorted arrays
	return s1.utf8.sorted() == s2.utf8.sorted()
}

// here are similar versions of the above using closures
// performance is basically the same as the non-closure versions
/*
func isAnagramV1b(string1: String, string2: String) -> Bool {
	
	let transform: ((String) -> String) = {
		return String($0.replacingOccurrences(of: " ", with: "").lowercased().characters.sorted())
	}
	
	return transform(string1) == transform(string2)
}

func isAnagramV2b(string1: String, string2: String) -> Bool {
	
	let transform: ((String) -> [UTF8.CodeUnit]) = {
		return $0.replacingOccurrences(of: " ", with: "").lowercased().utf8.sorted()
	}
	
	return transform(string1) == transform(string2)
}
*/


// VERSION 3
// idea to use NSCountedSet from: https://stackoverflow.com/a/40400649/234609

func isAnagramV3(string1: String, string2: String) -> Bool {
	let s1 = string1.replacingOccurrences(of: " ", with: "").lowercased()
	let s2 = string2.replacingOccurrences(of: " ", with: "").lowercased()
	
	let set1 = NSCountedSet(array: Array(s1.utf8))
	let set2 = NSCountedSet(array: Array(s2.utf8))
	
	return set1 == set2
}

// similar to the above, but using a closure
// performance is basically the same
/*
func isAnagramV3b(string1: String, string2: String) -> Bool {
	
	let transform: ((String) -> NSCountedSet) = {
		let s = $0.replacingOccurrences(of: " ", with: "").lowercased()
		return NSCountedSet(array: Array(s.utf8))
	}
	
	return transform(string1) == transform(string2)
}
*/


// VERSION 4
func isAnagramV4(string1: String, string2: String) -> Bool {
	var s1Dict = [Character: Int]()
	var s2Dict = [Character: Int]()
	
	for char in string1.lowercased().characters where char != " " {
		s1Dict[char] = (s1Dict[char] ?? 0) + 1
	}
	
	for char in string2.lowercased().characters where char != " " {
		s2Dict[char] = (s2Dict[char] ?? 0) + 1
	}
	
	return s1Dict == s2Dict
}


// VERSION 5
func isAnagramV5(string1: String, string2: String) -> Bool {
	var letters: [Character: Int] = [:]
	
	for letter in string1.lowercased().characters where letter != " " {
		if let exists = letters[letter] {
			letters[letter] = exists + 1
		} else {
			letters[letter] = 1
		}
	}
	
	for letter in string2.lowercased().characters where letter != " " {
		if let exists = letters[letter] {
			letters[letter] = exists - 1
		} else {
			letters[letter] = 1
		}
	}
	
	return letters.filter { $0.value != 0 }.count == 0
}




// MARK: - time tests

let ats = anagramTestStrings(length: 2000000)
let string1 = ats.s1
let string2 = ats.s2

printTimeElapsedWhenRunningCode(title: "VERSION 1") {
	if !isAnagramV1(string1: string1, string2: string2) {
		print("not an anagram?")
	}
}

printTimeElapsedWhenRunningCode(title: "VERSION 2") {
	if !isAnagramV2(string1: string1, string2: string2) {
		print("not an anagram?")
	}
}

printTimeElapsedWhenRunningCode(title: "VERSION 3") {
	if !isAnagramV3(string1: string1, string2: string2) {
		print("not an anagram?")
	}
}

printTimeElapsedWhenRunningCode(title: "VERSION 4") {
	if !isAnagramV4(string1: string1, string2: string2) {
		print("not an anagram?")
	}
}

printTimeElapsedWhenRunningCode(title: "VERSION 5") {
	if !isAnagramV5(string1: string1, string2: string2) {
		print("not an anagram?")
	}
}
