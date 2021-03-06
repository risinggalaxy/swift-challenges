import Foundation

/*
 Power of Two
 Could you write a function to determine if an integer is a power of two?
 
 For example:
 
 Input: 1
 Output: true
 Explanation: 2^0 = 1
 
 Input: 16
 Output: true
 Explanation: 2^4 = 16
 
 Input: 218
 Output: false
 
 Even though the Swift SDK has built in functionality to accomplish this task, how would you write this
 algorithm from scratch? Could the input values be interpreted in a different way to achieve our objective?
 
 */
//
//func isPowerOf(n: Int, x: Int ) -> Bool {
//    return ((_abs(x) / n) % n == .zero)
//}
//
////Could also use default Swift abs() method
//private func _abs( _ n: Int ) -> Int {
//    return n < 0 ? n * -1 : n
//}
//
////Power Of Two
//isPowerOf(n: 2, x: 1)
//isPowerOf(n: 2, x: 16)
//isPowerOf(n: 2, x: 8)
//isPowerOf(n: 2, x: 218)
//
////Power Of Ten
//isPowerOf(n: 10, x: 50)
//isPowerOf(n: 10, x: 1500)
//isPowerOf(n: 10, x: 30)
//isPowerOf(n: 10, x: 23)
//

//public func solution(_ A : inout [Int]) -> Int {
//    var counter = [Int: Bool]()
//    for i in A {
//        counter[i] = true
//    }
//
//    var i = 1
//    while true {
//        if counter[i] == nil {
//            return i
//        } else {
//            i += 1
//        }
//    }
//}
//
//var a = [1, 3, 6, 4, 1, 2, 5, 8]
//print(solution(&a))
//
//var b = [1, 2, 3]
//print(solution(&b))
//
//var c = [-1, -3]
//print(solution(&c))
let binary = String(20, radix: 2)
print(Array(arrayLiteral: binary))
