import Foundation
import XCTest
/*
 3. Removing Extra Space
 Given a proposed String, write an in-place algorithm to remove all whitespace. For this challenge,
 assume you don’t have access to a regular expression engine or SDK library function:
 let sequence = "The qu ick fox jum ped over the lazy d o g"
 How will your function search through the the data?
 How will you track the removal of data? Will your solution make use of fast enumeration? Why or why not?
 */
class RemoveExtraWhiteSpace {
    func removeWhiteSpace(_ input: String) -> String {
        guard input.count > 1 else { return input }
        let chars = Array(input)
        var str = ""
        let m = chars.count
        var n = 0
        while n < m {
            if chars[n] != " " {
                str.append(chars[n])
            }
            n += 1
        }
        return str
    }
    
    func removeWhiteSpace(_ input: inout String)  {
        guard input.count > 1 else { return }
        let chars = Array(input)
        var str = ""
        let m = chars.count
        var n = 0
        while n < m {
            if chars[n] != " " {
                str.append(chars[n])
            }
            n += 1
        }
        input = str
    }
}

class TestRemoveExtraWhiteSpace: XCTestCase {
    func testRemoveWhiteSpaceHappyPath() {
        let removeExtraWS = RemoveExtraWhiteSpace()
        let input = "The qu ick fox jum ped over the lazy d o g"
        let result = removeExtraWS.removeWhiteSpace(input)
        let testData = "Thequickfoxjumpedoverthelazydog"
        XCTAssertEqual(result, testData)
    }
    
    func testRemoveWhiteSpaceInout() {
        let removeExtraWS = RemoveExtraWhiteSpace()
        var input = "The qu ick fox jum ped over the lazy d o g"
        removeExtraWS.removeWhiteSpace(&input)
        let testData = "Thequickfoxjumpedoverthelazydog"
        XCTAssertEqual(input, testData)
    }
    
    func testRemoveWhiteSpace() {
        let removeExtraWS = RemoveExtraWhiteSpace()
        let input = " T h e q u   i ck f  o x j  u   m p  e  d  ov   e   r t  h  e l a  zy d o g     "
        let result = removeExtraWS.removeWhiteSpace(input)
        let testData = "Thequickfoxjumpedoverthelazydog"
        XCTAssertEqual(result, testData)
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
