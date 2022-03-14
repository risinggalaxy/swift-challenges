import Foundation
import XCTest

/*
 2. Sorting Colors
 Given an array with n objects colored red, white or blue,
 sort them in-place so that objects of the same color are
 adjacent, with the colors in the order red, white and blue.
 Here, we will use the integers 0, 1, and 2 to represent the color red, white, and blue respectively:
 let sequence = [2,0,2,1,1,0] -> [0, 0, 1, 1, 2, 2]
 If not done correctly, sorting data can be one of the most expensive aspects of any program or application.
 While standard production sorting algorithms run in O(n log n) time,
 the average / worst case runtimes often produce a O(n) squared result.
 Is there a more efficient technique or algorithm you could implement to sort the color sequence?
 */

class ColorSort {
    func sort( _ input: [Int]) -> [Int] {
        guard input.count > 1 else { return input }
        var lhs = [Int]()
        var rhs = [Int]()
        var equal = [Int]()
        for i in 0..<input.count {
            let value = input[i]
            if value < 1 {
                lhs.append(value)
            } else if value > 1 {
                rhs.append(value)
            } else if value == 1 {
                equal.append(value)
            }
        }
        return lhs + equal + rhs
    }
}

class TestSortingColors: XCTestCase {
    func testSortingColors() {
        let colorSort = ColorSort()
        let input = [0,1,0,2,1,1,2,2,2,2,0,0,0,0,1,1,0,1,2,2,2,2,0,0,0,1,1]
        let result = colorSort.sort(input)
        let testData = [0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2]
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
