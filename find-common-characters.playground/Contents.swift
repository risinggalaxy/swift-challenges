import Foundation
import XCTest

/*
 Find Common Characters
 Given an array of strings made only from lowercase letters, return a list of all characters
 that show up in all strings within the list (including duplicates).
 For example, if a character occurs 3 times in all strings but not 4 times,
 you need to include that character three times in the final answer:
 
 Input:["cool","lock","cook"]
 Output:["c","o"]
 
 Often when solving code challenges, specific words or phrases used provide clues
 for how best to approach the problem. For this challenge we see the word duplicates highlighted.
 Can you think of the an algorithm or data structure that addresses the common scenario of
 duplicates? How could this model be used to help us find common characters?
 */

class FindCommonCharacters {
    func check( _ input: [String] ) -> [Character] {
        guard !input.isEmpty else { return []}
        guard let s = input.first else { return []}
        var result = ""
        var n = 1
        let m = input.count
        while n < m {
            result = getCommonString(lhs: s, rhs: input[n])
            n += 1
        }
        return Array(result)
    }
    
    private func getCommonString(lhs: String, rhs: String) -> String {
        let lhsArr = Set(lhs)
        let rhsArr = Set(rhs)
        var result = ""
        for c in lhsArr {
            if rhsArr.contains(c) {
                result.append(c)
            }
        }
        return result
    }
}

class TestFindCommonCharacters: XCTestCase {
    
    var sut: FindCommonCharacters!
    
    override func setUp() {
        super.setUp()
        sut = FindCommonCharacters()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testHappyPath_FindsCommonChars() {
        let test = sut.check(["cool","lock","cook"])
        let result:[Character] = ["c", "o"]
        XCTAssertEqual(test.sorted(), result.sorted())
    }
    
    func testFindsNoCommonChars() {
        let test = sut.check(["car","tv","book"])
        let result:[Character] = []
        XCTAssertEqual(test.sorted(), result.sorted())
    }
}

class TestObservation: NSObject, XCTestObservation {
    func testCase(_ testCase: XCTestCase, didRecord issue: XCTIssue) {
        assertionFailure(issue.description)
    }
}

let testObservation = TestObservation()
XCTestObservationCenter.shared.addTestObserver(testObservation)
XCTestSuite.default.run()
