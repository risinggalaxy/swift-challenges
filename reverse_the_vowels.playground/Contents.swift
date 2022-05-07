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
        //Check whether the input value is not empty
        guard !s.isEmpty else { return s }
        
        //Converting the input value into an Array of Characters
        //We are going to be manipulating the order of this Array
        //That is why it should be a var/ variable and not a let/ constant
        var res: [Character] = Array(s)
        
        //Create a lookup array and remove any whitespaces
        let chars = Array(s.trimmingCharacters(in: .whitespacesAndNewlines))
        
        //Create a reference, which tells us the number of input Characters
        let m = s.count
        
        //The pointer that tracks characters from the left side
        var i = 0
        
        //The pointer that tracks characters from the right side
        var j = m - 1
        
        //We will continue looping as long as i is less than j
        while i < j {
            
            //MARK: FIRST CHECK
            //It's time to call our isVowel(_:Character) method,
            //and check whether the current character
            //on the left side is a vowel
            //and the one on the right side is not a vowel
            if isVowel(chars[i]) && !isVowel(chars[j]) {
                //We should grab the character
                //from our lookup array on the 'j(th)' index
                //and insert it to the res array at the 'j(th)' index
                res.insert(chars[j], at: j)
                
                //Now, because we have injected a
                //new character into our 'res' array
                //the number of the 'res' characters has grown by 1
                //that's why we should remove
                //the extra character on the (j + 1) index
                res.remove(at: j + 1)
                
                //Now, we should decrement 'j' by 1
                //this will move this pointer 1 step to the left
                //as you can see, we are not touching the 'i'
                //because were able to found a vowel there,
                //so it should remain were it is
                //until we find a vowel on the left side
                j -= 1
                
                //MARK: SECOND CHECK
                //if we didn't find a vowel on the left side
                //but we managed to find a vowel on the right side
            } else if !isVowel(chars[i]) && isVowel(chars[j]) {
                
                //We should grab the character
                //from our lookup array on the 'i'(th) index
                //and insert it to the 'res' array at the 'i'(th) index
                res.insert(chars[i], at: i)
                
                //Because we have injected a new character into our 'res' array
                //the number of the 'res' characters has grown by 1
                //that's why we should remove
                //the character on the (i + 1) index
                res.remove(at: i + 1)
                
                //Next, we should increment 'i' by 1
                //this will move this pointer 1 step to the right
                //as you can see, we are not touching 'j' this time.
                //Because found a vowel there,
                //we should let it stay where it is,
                //until we find a vowel on the right side
                i += 1
                
                //MARK: THIRD CHECK
                //If we were able to find a vowel on both sides
                //Now, we should handle our character swapping
            } else if isVowel(chars[i]) && isVowel(chars[j]) {
                
                //We should grab the vowel from
                //our lookup on the 'i'(th) index
                //and insert it to the 'res' array at the 'j'(th) position
                res.insert(chars[i], at: j)
                
                //Again because we have injected a new
                //character into our 'res' array
                //the number of the 'res' characters has grown by 1
                res.remove(at: j + 1)
                
                //We should grab the vowel from
                //our lookup on the 'j'(th) postion
                //and insert it to the 'res' array at the 'i'(th) position
                res.insert(chars[j], at: i)
                
                //Again, because we have injected
                //a new character into our 'res' array
                //the number of the 'res' characters has grown by 1
                res.remove(at: i + 1)
                
                //Decrementing 'j' by 1 and moving it to the left
                j -= 1
                
                //Incrementing 'i' by 1 and moving it to the right
                i += 1
                
                //MARK: FINAL CHECK
                //If we didn't find vowels on both side
            } else {
                //We should grab the 'i'(th) character from the lookup array
                //and insert it at the 'i'(th) position of the 'res' array
                res.insert(chars[i], at: i)
                
                //Remove character on (i + 1)
                res.remove(at: i + 1)
                
                //Then, grab the 'j'(th) character from the lookup array
                //and insert it at the 'j'(th) index of the 'res' array
                res.insert(chars[j], at: j)
                
                //Remove character on (j + 1)
                res.remove(at: j + 1)
                
                //Decrement 'j' by 1 and move it to the right
                j -= 1
                
                //Increment 'i' by 1 and move it to the left
                i += 1
            }
        }
        //Everything is handled properly,
        //it's time to return the final result
        //by converting the 'res' array to a String
        return String(res)
    }
    
    private func isVowel( _ c: Character) -> Bool {
        switch c.lowercased() {
        case "a", "e", "i", "o","u" : return true
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
