import Foundation
import XCTest

/*
 Count of Occurrences
 Could you write a function that lists the number of occurrences for each word in descending
 order? For the output, assume your solution makes use of a standard Swift Dictionary or Array of tuple values.
 Also assume your algorithm does not make use of any built-in Swift sorting functions.
 input:
 this is a test of the emergency broadcast system this is only a test dog dog dog
 output:
 dog 3
 a 2
 is 2
 test 2
 this 2
 broadcast 1
 emergency 1
 of 1
 only 1
 the 1
 system 1
 At first glance, this challenge seems relatively straightforward.
 The idea being one could easily iterate through a list of words in O(n) — linear time and track the number of word
 occurrences with a standard dictionary. However, difficulty is introduced when sorting the word list.
 Without using a built-in function, how would you keep the list sorted as new items are being added?
 */

class CountOccurences {
    
    func countOfOccurences( _ s: String ) -> String {
        let words: [String] = s.components(separatedBy: " ")
        var hashMap = [String: Int]()
        var indecies = [(x: Int, s: String)]()
        var n = 0
        let m = words.count
        var res = ""
        
        while n < m {
            if hashMap[words[n]] != nil {
                hashMap[words[n]] = hashMap[words[n]]! + 1
            } else {
                hashMap[words[n]] = 1
            }
            n += 1
        }
        
        for (key,value) in hashMap {
            let val = (x: value, s: key)
            indecies.append(val)
        }
        
        sort(&indecies)
        
        for i in indecies {
            res += "\n\(i.s) \(i.x)"
        }
        
        return res
    }
    
    private func sort( _ s: inout [(x: Int, s: String)]) {
        
        guard s.count > 1 else { return }
        let m = s.count
        var i = 0
        var j = i + 1
        
        while i < m {
            let iVal = s[i]
            let jVal = s[j]
            if iVal.x < jVal.x {
                s[i] = jVal
                s[j] = iVal
                j += 1
            } else if iVal.x > jVal.x || iVal.x == jVal.x {
                j += 1
            }
            if j == m  {
                i += 1
                if i == m - 1  {
                    break
                } else {
                    j = i + 1
                }
            }
        }
    }
}

class TestCountOccurences: XCTestCase {
    
    var sut: CountOccurences!
    
    override func setUp() {
        super.setUp()
        sut = CountOccurences()
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func testExtreamRepeatition() {
        let input = "This is a test This is a test This is a test This is a test This is a test This is a test This is a test This is a test This is a test This is a test This This This This is is test z"
        let expectedResult = """

        This 14
        is 12
        test 11
        a 10
        z 1
        """
        let result = sut.countOfOccurences(input)
        XCTAssertEqual(expectedResult, result)
    }
    
    func testNormalRepeatition() {
        let input = "This is This is This is This is This a test a"
        let expectedResult = """
        
        This 5
        is 4
        a 2
        test 1
        """
        let result = sut.countOfOccurences(input)
        XCTAssertEqual(expectedResult, result)
    }
    
    func testNoRepeatition() {
        let input = "This This This is is a"
        let expectedResult = """

        This 3
        is 2
        a 1
        """
        let result = sut.countOfOccurences(input)
        XCTAssertEqual(expectedResult, result)
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
