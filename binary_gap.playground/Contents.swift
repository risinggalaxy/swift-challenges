import Foundation

/*
 A binary gap within a positive integer N is any maximal sequence of consecutive zeros that is surrounded by ones at both ends in the binary representation of N.
 
 For example, number 9 has binary representation 1001 and contains a binary gap of length 2. The number 529 has binary representation 1000010001 and contains two binary gaps: one of length 4 and one of length 3. The number 20 has binary representation 10100 and contains one binary gap of length 1. The number 15 has binary representation 1111 and has no binary gaps. The number 32 has binary representation 100000 and has no binary gaps.
 
 Write a function:
 
 class Solution { public int solution(int N); }
 that, given a positive integer N, returns the length of its longest binary gap. The function should return 0 if N doesn't contain a binary gap.
 
 For example, given N = 1041 the function should return 5, because N has binary representation 10000010001 and so its longest binary gap is of length 5. Given N = 32 the function should return 0, because N has binary representation '100000' and thus no binary gaps.
 
 Write an efficient algorithm for the following assumptions:
 
 //10000010001
 //1111
 
 N is an integer within the range [1..2,147,483,647].
 
 */

//public func solution(_ N: Int) -> Int {
//
//    var bitPositions: [Int] = [] // Positions of all `1` bits in `n`
//    let binaryRepr = String(N, radix:2) //
//
//    for (index, char) in binaryRepr.enumerated() where char == "1" {
//        bitPositions.append(index)
//    }
//
//    var longestGap: Int = 0
//
//    if bitPositions.count >= 2 {
//        for i in 0...bitPositions.count - 2 {
//            let gap = bitPositions[i + 1] - bitPositions[i] - 1
//            if gap > longestGap {
//                longestGap = gap
//            }
//        }
//    }
//
//    return longestGap
//}
//
//print(solution(102030405))



"""
******* /1
 ***** /2
  *** /3
   * /4
"""
//
var str = ""
var n = 4
//

for i in 1...n {
    for _ in stride(from: i, to: n, by: 1) {
        str += " "
    }
    for _ in 2...(2 * i) {
        str += "*"
    }
    print(str)
    str = ""
}

for i in stride(from: n, to: 0, by: -1){
    for _ in stride(from: n, to: i, by: -1) {
        str += " "
    }
    for _ in (0...(2 * i) - 2 ).reversed() {
        str += "*"
    }
    print(str)
    str = ""
}

//
//var arr = [1,2,3,4,4,5,6,7,8,1,7,9,0,5,4,5,6,7,1]
//var indexPosition = [Int]()
//for (index, element) in arr.enumerated() where element == 1 {
//    indexPosition.append(index)
//}
//print(indexPosition)


