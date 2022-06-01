import Foundation
import XCTest

/*
 A group of friends is going on holiday together. They have come to a meeting point (the start of the
 journey) using N cars. There are P[K] people and S[K] seats in the K-th car for K in range [0..N-1].
 Some of the seats in the cars may be free, so it is possible for some of the friends to change the car
 they are in. The friends have decided that, in order to be ecological, they will leave some cars parked
 at the meeting point and travel with as few cars as possible.
 
 Write a function:
 
 public func solution(_ P: inout [Int], _ S: inout [Int]) -> Int
 
 given two arrays P and S, consisting of N integers each, returns the minimum number of cars
 needed to take all of the friends on holiday.
 
 Examples:
 
 1. Given P = [1, 4, 1] and S = [1, 5, 1], the function should return 2. A person from car number 0 can
 travel in car number 1 instead. This way, car number O can be left parked at the meeting point.
 
 2. Given P = [4, 4, 2, 4] and S = [5, 5, 2, 51, the function should return 3. One person from car number 2
 can travel in car number 0 and the other person from car number 2 can travel in car number 3.
 
 3. Given P = [2, 3, 4, 2] and S = [2, 5, 7, 2], the function should return 2. Passengers from car number 0
 can travel in car number 1 and passengers from car number 3 can travel in car number 2.
 
 Write an efficient algorithm for the following assumptions:
 N is an integer within the range [1..100,000];
 
 each element of arrays P and S is an integer within the range [1..9];
 every friend had a seat in the car they came in; that is, P[K] ≤ S[K] for each K within the
 range [0..N-1].
 */

class Solution {
    func solution( _ P: inout [Int], _ S: inout [Int]) -> Int {
        guard P.count == S.count else { return .zero }
        
        var result = 0
        var passengers = 0
        
        S = S.sorted(by: >)
        let N = S.count
        
        for i in 0...P.count - 1 where P[i] > 0 && P[i] < 10 {
            passengers += P[i]
        }
        
        for i in 0...N - 1 where S[i] > 0 && S[i] < 10 {
            if passengers > 0 {
                passengers -= S[i]
                result += 1
            }
        }
        
        return result
    }
}

class TestSolution: XCTestCase {
    
    var sut: Solution!
    
    override func setUp() {
        super.setUp()
        sut = Solution()
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func test_Solution_Should_returnZero() {
        var P = [1, 4, 1]
        var S = [1, 5, 1]
        let result = sut.solution(&P, &S)
        let expectedResult = 2
        XCTAssertEqual(result, expectedResult, "Result: \(result) should be equal to expected result: \(expectedResult)")
    }
        
    func test_Solution_NumberOne() {
        var P = [1, 4, 1]
        var S = [1, 5, 1]
        let result = sut.solution(&P, &S)
        let expectedResult = 2
        XCTAssertEqual(result, expectedResult, "Result: \(result) should be equal to expected result: \(expectedResult)")
    }
    
    func test_Solution_NumberTwo() {
        var P = [4, 4, 2, 4]
        var S = [5, 5, 2, 5]
        let result = sut.solution(&P, &S)
        let expectedResult = 3
        XCTAssertEqual(result, expectedResult, "Result: \(result) should be equal to expected result: \(expectedResult)")
    }
    
    func test_Solution_NumberThree() {
        var P = [2, 3, 4, 2]
        var S = [2, 5, 7, 2]
        let result = sut.solution(&P, &S)
        let expectedResult = 2
        XCTAssertEqual(result, expectedResult, "Result: \(result) should be equal to expected result: \(expectedResult)")
    }
    
    func test_Solution_NumberFour() {
        var P = [1, 5, 4, 3, 2, 1]
        var S = [2, 5, 7, 5, 2, 1]
        let result = sut.solution(&P, &S)
        let expectedResult = 3
        XCTAssertEqual(result, expectedResult, "Result: \(result) should be equal to expected result: \(expectedResult)")
    }
    
    func test_Solution_NumberFive() {
        var P = [2, 5, 4, 5, 2, 1]
        var S = [2, 5, 7, 5, 2, 1]
        let result = sut.solution(&P, &S)
        let expectedResult = 4
        XCTAssertEqual(result, expectedResult, "Result: \(result) should be equal to expected result: \(expectedResult)")
    }
    
    func test_Solution_NumberSix() {
        var P = [2, 5, 6, 5, 2, 1]
        var S = [2, 5, 7, 5, 2, 1]
        let result = sut.solution(&P, &S)
        let expectedResult = 5
        XCTAssertEqual(result, expectedResult, "Result: \(result) should be equal to expected result: \(expectedResult)")
    }
    
    func test_Solution_NumberSeven() {
        var P = [2, 5, 6, 5, 2, 1, 1]
        var S = [2, 5, 7, 5, 2, 1, 2]
        let result = sut.solution(&P, &S)
        let expectedResult = 6
        XCTAssertEqual(result, expectedResult, "Result: \(result) should be equal to expected result: \(expectedResult)")
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

/*
 Conclusion:
 
 Conclusion:
 
 Much like any other interview question, this is a tricky one too.
 After solving this puzzle, we can conclude that the solution doesn't really care about which passenger goes to which car.
 E.g it doesn't matter whether a passenger from car 0 goes to car 3,
 meaning you don't really have keep track of the cars.
 
 It's rather about distributing the passengers over the available seats.
 To get the answer right we should start with the highest number of seats,
 then subtract the passenger number by that number,
 until there are no more passengers left over.
 we should just keep counting each passenger distribution iteration,
 Once there are no more passengers left to be distributed. We should simply return the iteration count.
 Honestly, it took me around 2 hours to figure this out,
 
 I noticed, I was thinking too complicated. I was doubting whether I should use recursion?
 or use a hash map?,  or maybe pointers to track each array element individually?
 Once I got it done, I started to realise how simple it actually was.
 
 */
