import Foundation
import XCTest
/* Write a sorting algorithm to sort an
 array of integers in an ascending order with an O(n) runtime.
 */
class AscendingSort {
    func sort(_ s: inout [Int]) {
        guard s.count > 1 else { return }
        let m = s.count
        var n = 0
        var i = n + 1
        while n < m {
            let nVal = s[n]
            let iVal = s[i]
            if nVal > iVal {
                s[n] = iVal
                s[i] = nVal
                i += 1
            } else if nVal < iVal || nVal == iVal {
                i += 1
            }
            if i == m {
                n += 1
                if n == m - 1 {
                    break
                } else {
                    i = n + 1
                }
            }
        }
    }
}
class TestAscendingSort: XCTestCase {
    
    var sut: AscendingSort!
    
    override func setUp() {
        super.setUp()
        sut = AscendingSort()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func sortArrayOfRandomIntegers() {
        var arr = [1, 2, 1, 4, 2, 5, 6, 8,
                   9, 10, 2, 1, 2, 3, 20, 1, 20, 25,
                   60, 100, 50, 1, 0, 2, 0, 8, 0, 1]
        let expectedResult = [0, 0, 0, 1, 1, 1, 1, 1, 1, 2,
                              2, 2, 2, 2, 3, 4, 5, 6, 8, 8, 9,
                              10, 20, 20, 25, 50, 60, 100]
        sut.sort(&arr)
        XCTAssertEqual(arr, expectedResult)
        
    }
    
    func sortArrayOfOnesAndZeros() {
        var arr = [0, 1, 0, 1, 0, 0, 1, 0, 1, 0,
                   1, 0, 0, 0, 0, 0, 1, 1, 1, 1,
                   0, 1, 0, 1]
        let expectedResult = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                              0, 0, 0, 1, 1, 1, 1, 1, 1, 1,
                              1, 1, 1, 1]
        sut.sort(&arr)
        XCTAssertEqual(arr, expectedResult)
        
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


