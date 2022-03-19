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

    func fastPairValues(_ s:[Int], _ g: Int) -> [Int]{ //O(n)
        let isNegative = g < 0
        let absValue = abs(g)
        guard s.count > 1 else { return [Int]()}
        let m = s.count
        var hash = [Int:Int]()
        var res = [Int]()
        for n in 0..<m {
            let x = s[n]
            if hash[abs(x - absValue)] != nil && x + hash[abs(x - absValue)]! == absValue {
                    res.append(isNegative ? -x : x)
                    res.append(isNegative ? -((-x) - (-absValue))
                               : abs(x - absValue))
            }
            hash[x] = x
        }
        return res
    }
    
    func pairValueExpensive( _ s: [Int], _ g: Int) -> [Int] { //O(n^2)
        let isNegative = g < 0
        let absValue = abs(g)
        guard s.count > 1 else {return [Int]()}
        let m = s.count
        var n = 0
        var res = [Int]()
        while n < m {
            let x = s[n]
            for i in n + 1..<m {
                if abs(x + s[i]) == absValue {
                    res.append(isNegative ? -x : x )
                    res.append(isNegative ? -(s[i]) : s[i])
                }
            }
            n += 1
        }
        return res
    }

let result = fastPairValues([2,4,3,1,6,8,7,5,9,10,11,12,15,14,16,18,17,13,19], 30)
print(result)
let resultExpensive = pairValueExpensive([2,4,3,1,6,8,7,5,9,10,11,12,15,14,16,18,17,13,19], 30)
print(resultExpensive)
