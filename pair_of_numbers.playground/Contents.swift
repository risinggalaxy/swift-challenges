import Foundation
/*
 Pair of Numbers
 Assuming you have been given an array of numbers and
 you need to find a pair of numbers which are equal to the given target value.
 Numbers can be either positive, negative or both.
 Can you design an algorithm that works in O(n) — linear time or greater?
 let sequence = [8, 10, 2, 9, 7, 5]
 let results = pairValues(11) = //returns (9, 2)
 What’s interesting about this solution is that it can be solved using different techniques.
 The main objective is calculating which numbers can be paired to achieve the expected result.
 How could this work, assuming your algorithm is only permitted to scan the sequence once?
 */
func pairValues(_ sequence:[Int], _ num: Int) -> [Int]{ //O(n)
    let start = Date()
    let isNegative = num < 0
    let absValue = abs(num)
    guard sequence.count > 1 else { return [Int]()}
    let m = sequence.count
    var hash = [Int:Bool]()
    var result = [Int]()
    for n in 0..<m {
        let x = sequence[n]
        if hash[abs(x - absValue)] != nil {
            result.append(isNegative ? -x : x)
            result.append(isNegative ? -((-x) - (-absValue)) : abs(x - absValue))
        }
        hash[x] = true
    }
    let end = Date()
    let component = Calendar.current.dateComponents([.nanosecond], from: start, to: end)
    let milliseconds = Double(component.nanosecond! / 1000000)
    print("Runtime : \(milliseconds)")
    return result
}
let result = pairValues([2,4,3,1,6,8,7,5,9], 10)
print(result)

let nResult = pairValues([2,4,3,1,6,8,7,5,9], -10)
print(nResult)
