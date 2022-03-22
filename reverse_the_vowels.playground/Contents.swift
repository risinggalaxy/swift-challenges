import Foundation
import XCTest
/*
 Reverse the Vowels
 You’ve been asked by your manager to build a new algorithm to reverse vowels in any proposed String. How would
 you build such a model, assuming you aren’t allowed to use any native String reverse() functions in your code?
 e.g. Hello = Holle
 e.g. BinarySearch = BanerySairch
 When preparing for a technical interview, it’s common to practice code challenges on String manipulation,
 including being able to reverse sequences. This challenge presents a twist by reversing specific values. How
 will you track the position of vowels as you iterate through the model? Also, how will you reverse the series
 of vowels without using native Swift library functions?
 */
class ReverseVowel {
    func reverseVowel(_ s: String) -> String {
        let start = Date()
        guard !s.isEmpty else { return s }
        var res: [Character] = Array(s)
        let chars = Array(s.trimmingCharacters(in: .whitespacesAndNewlines))
        let m = s.count
        var i = 0
        var j = m - 1
        while i < j {
            if isVowel(chars[i]) && !isVowel(chars[j]) {
                res.insert(chars[j], at: j)
                res.remove(at: j + 1)
                j -= 1
            } else if !isVowel(chars[i]) && isVowel(chars[j]) {
                res.insert(chars[i], at: i)
                res.remove(at: i + 1)
                i += 1
            } else if isVowel(chars[i]) && isVowel(chars[j]) {
                res.insert(chars[i], at: j)
                res.remove(at: j + 1)
                res.insert(chars[j], at: i)
                res.remove(at: i + 1)
                j -= 1
                i += 1
            } else {
                res.insert(chars[i], at: i)
                res.remove(at: i + 1)
                res.insert(chars[j], at: j)
                res.remove(at: j + 1)
                j -= 1
                i += 1
            }
        }
        let end = Date()
        let component = Calendar.current.dateComponents([.nanosecond], from: start, to: end)
        let milliSecond = Double(component.nanosecond! / 1000000)
        print("------> Runtime: \(milliSecond) <------")
        return String(res)
    }
    
    private func isVowel( _ c: Character) -> Bool {
        switch c {
        case "a", "A", "e", "E", "i", "I", "o", "O", "u", "U": return true
        default: return false
        }
    }
}

class TestReverseVowels: XCTestCase {
    
    var sut: ReverseVowel!
    
    override func setUp() {
        super.setUp()
        sut = ReverseVowel()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testShort() {
        let input = "Hello"
        let testData = "Holle"
        let result = sut.reverseVowel(input)
        XCTAssertEqual(result, testData)
    }
    
    func testMedium() {
        let input = "Binary Search"
        let testData = "Banery Sairch"
        let result = sut.reverseVowel(input)
        XCTAssertEqual(result, testData)
    }
    
    func testLong() {
        let input = "United States Of America"
        let testData = "anited StAtOs ef americU"
        let result = sut.reverseVowel(input)
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
