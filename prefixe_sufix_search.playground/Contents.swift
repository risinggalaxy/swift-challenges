import Foundation
import XCTest
/*
 Prefix and Suffix Search
 In a technical interview, you’ve been asked to design a class WordFilter that supports one function,
 WordFilter.f(String prefix, String suffix). It will return the word with given prefix and suffix.
 If no word exists, return -1.
 WordFilter.(["apple"])
 WordFilter.(["app"])
 WordFilter.f("a", "e") // returns 0
 WordFilter.f("b", "") // returns -1
 While most structures are designed to manage generic data,
 other models are more efficient when managing textual content.
 As a result, these specialized solutions are often at the core of search engine requests,
 dictionaries and many types of games.
 */
class WordFilter {
    private let words: [String] = ["apple", "app", "book", "car", "play", "iphone",
                                   "google", "ipad", "swift", "challenge", "app"]
    
    var foundWord: String = ""
    
    func f( _ prefix: String, _ sufix: String ) -> Int {
        let m = words.count
        var found: Bool = false
        for i in 0..<m {
            guard let firstChar = words[i].first else { return -1 }
            guard let lastChar = words[i].last else { return -1 }
            if firstChar == prefix.first && lastChar == sufix.last {
                found = true
                foundWord = words[i]
                break
            } else if firstChar != prefix.first || lastChar != sufix.last {
                found = false
            }
        }
        return found ? 0 : -1
    }
}

class TestWordFilter: XCTestCase {
    
    var sut: WordFilter!
    
    override func setUp() {
        super.setUp()
        sut = WordFilter()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testWordFilter_WhenFindingWord_ReturnsZero() {
        let resultOne = sut.f("a", "p")
        XCTAssertEqual(resultOne, 0)
        let resultTwo = sut.f("a", "e")
        XCTAssertEqual(resultTwo, 0)
        let resultThree = sut.f("i", "e")
        XCTAssertEqual(resultThree, 0)
    }
    
    func testWordFilter_WhenNotFindingWord_ReturnsMinusOne() {
        let resultOne = sut.f("", "p")
        XCTAssertEqual(resultOne, -1)
        let resultTwo = sut.f("a", "")
        XCTAssertEqual(resultTwo, -1)
        let resultThree = sut.f("", "")
        XCTAssertEqual(resultThree, -1)
    }
    
    func testWordFilter_WhenFindingWord_FoundWordShouldBeEqualToTestData() {
        sut.f("a", "p")
        XCTAssertEqual(sut.foundWord, "app")
        sut.f("a", "e")
        XCTAssertEqual(sut.foundWord, "apple")
        sut.f("s", "t")
        XCTAssertEqual(sut.foundWord, "swift")
        sut.f("c", "e")
        XCTAssertEqual(sut.foundWord, "challenge")
        sut.f("i", "e")
        XCTAssertEqual(sut.foundWord, "iphone")
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
