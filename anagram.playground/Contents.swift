import Foundation
import XCTest

// Challenge: Given two strings, write an algorithm to detect whether one word is an anagram of the other.
// An anagram is a word that can be made by changing the order of the letters in another word.
//
// For example:
// tar => rat
// state => taste

class Anagram {
    
    func simpleSolution( _ a: String, _ b: String) -> Bool {
        let start = Date()
        let resA = a.lowercased().sorted()
        let resB = b.lowercased().sorted()
        let end = Date()
        let component = Calendar.current.dateComponents([.nanosecond], from: start, to: end)
        let milliSeconds = Double(component.nanosecond! / 1000000)
        print("simpleSolution Runtime : \(milliSeconds) ")
        return resA == resB
    }
    
    func complexSolution( _ a: String, _ b: String ) -> Bool {
        let start = Date()
        guard a.count == b.count else { return false }
        let aChars = Array(a.lowercased())
        let bChars = Array(b.lowercased())
        var hashMap = [Character: Bool]()
        var found: Bool = false
        for c in aChars {
            hashMap[c] = true
        }
        for c in bChars {
            if hashMap[c] != nil {
                found = true
                continue
            } else {
                found = false
                break
            }
        }
        let end = Date()
        let component = Calendar.current.dateComponents([.nanosecond], from: start, to: end)
        let milliSeconds = Double(component.nanosecond! / 1000000)
        print("complexSolution Runtime : \(milliSeconds) ")
        return !found ? false : true
    }
}

class TestAnagram: XCTestCase {
    
    var sut: Anagram!
    
    override func setUp() {
        super.setUp()
        sut = Anagram()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testSimpleSimpleSolutionShouldPass() {
        let result = sut.simpleSolution("night", "thing")
        XCTAssertTrue(result)
    }
    
    func testSimpleSimpleSolutionReturnsFalse() {
        let result = sut.simpleSolution("tight", "thing")
        XCTAssertFalse(result)
    }
    
    func testSimpleComplexSolutionShouldPass() {
        let result = sut.complexSolution("night", "thing")
        XCTAssertTrue(result)
    }
    
    func testSimpleComplexSolutionReturnsFalse() {
        let result = sut.complexSolution("tight", "thing")
        XCTAssertFalse(result)
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
