import Foundation
import XCTest
/*
 Find Common Element in Rows
 Given a matrix where every row is sorted in increasing order, return the smallest common element in all rows.
 If there is no common element return -1.
 Input: mat = [[1,2,3,4,5,8], [2,4,5,8,10], [3,5,7,8,9,11], [1,3,5,7,8,9]]
 Output: 5
 How will you keep track of elements common to all rows? How many elements are common to all rows?
 How will you find the smallest value? As shown, there are a number of possibilities to track.
 Could the use of a specialized data structure be used to streamline your solution?
 */

class FindCommonElement {
    
    func find(_ value: [[Int]]) -> Int {
        
        guard value.count > 0 else { return .zero }
        let start = Date()
        var hashMap = [Int: Bool]()
        let m = value.count
        
        for i in value[0] {
            hashMap[i] = true
        }
        
        for j in 1..<m {
            var tempHash = [Int:Bool]()
            for n in value[j] {
                if hashMap[n] != nil {
                    tempHash[n] = hashMap[n]
                }
            }
            hashMap = tempHash
        }
        
        let end = Date()
        let component = Calendar.current.dateComponents([.nanosecond], from: start, to: end)
        let milliseconds = Double(component.nanosecond! / 1000000)
        print("Algorithm runtime in milliseconds: \(milliseconds)")
        
        return hashMap.isEmpty ? -1 : self.min(hashMap)
    }
    
    private func min( _ hashMap: [Int: Bool] ) -> Int {
        guard !hashMap.isEmpty else { return -1 }
        if hashMap.count == 1 {
            return hashMap.first!.key
        }
        var lhs: Int?
        var rhs: Int?
        for (key, _ ) in hashMap {
            if lhs == nil {
                lhs = key
            } else {
                //Always assuming that left holds the min value
                if lhs! > key {
                    rhs = lhs
                    lhs = key
                } else {
                    rhs = key
                }
            }
        }
        if lhs != nil && rhs == nil {
            return lhs!
        } else {
            return lhs! < rhs! ? lhs! : rhs!
        }
    }
}

class TestFindCommonElement: XCTestCase {
    
    var sut: FindCommonElement!
    
    override func setUp() {
        super.setUp()
        sut = FindCommonElement()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testFindsMinElement() {
        let matrix = [[1,2,3,4,5,8],[2,4,5,8,10,3,1], [3,5,7,8,9,11,1], [1,3,5,7,8,9],[1,2,3,4,5,8],[2,4,5,8,10,3,1], [3,5,7,8,9,11,1], [1,3,5,7,8,9],[1,3,5,7,8,9],[1,3,5,7,8,9],[1,2,3,4,5,8],[2,4,5,8,10,3,1], [3,5,7,8,9,11,1],[1,3,5,7,8,9],[1,2,3,4,5,8],[2,4,5,8,10,3,1],[3,5,7,8,9,11,1], [1,3,5,7,8,9],[1,3,5,7,8,9],[1,3,5,7,8,9],[1,3,5,7,8,9],[1,2,3,4,5,8],[2,4,5,8,10,3,1], [3,5,7,8,9,11,1], [1,3,5,7,8,9],[1,2,3,4,5,8],[2,4,5,8,10,3,1],[3,5,7,8,9,11,1],[1,3,5,7,8,9],[1,2,3,4,5,8],[2,4,5,8,10,3,1],
            [3,5,7,8,9,11,1],[1,3,5,7,8,9],[1,2,3,4,5,8],[2,4,5,8,10,3,1],[3,5,7,8,9,11,1],[1,3,5,7,8,9]]
        let expectedResult = 1
        let result = sut.find(matrix)
        XCTAssertEqual(result, expectedResult)
    }
    
    func testCannotFindAnyCommonElement() {
        let matrix = [[2,3,4,8],[2,4,5,8,10,1], [3,5,7,9,11,1],[1,3,5,7,8,9]]
        let expectedResult = -1
        let result = sut.find(matrix)
        XCTAssertEqual(result, expectedResult)
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
