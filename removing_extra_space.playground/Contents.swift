import Foundation
/*
 3. Removing Extra Space
 Given a proposed String, write an in-place algorithm to remove all whitespace. For this challenge,
 assume you don’t have access to a regular expression engine or SDK library function:
 let sequence = "The qu ick fox jum ped over the lazy d o g"
 How will your function search through the the data?
 How will you track the removal of data? Will your solution make use of fast enumeration? Why or why not?
 */

func removeWhiteSpace(_ input: String) -> String {
    guard input.count > 1 else { return input }
    let chars = Array(input)
    var str = ""
    let m = chars.count
    var n = 0
    while n < m {
        if chars[n] != " " {
            str.append(chars[n])
        }
        n += 1
    }
    return str
}

func removeWhiteSpace(_ input: inout String)  {
    guard input.count > 1 else { return }
    let chars = Array(input)
    var str = ""
    let m = chars.count
    var n = 0
    while n < m {
        if chars[n] != " " {
            str.append(chars[n])
        }
        n += 1
    }
    input = str
}

var input = "The qu ick fox jum ped over the lazy d o g"
let result = removeWhiteSpace("The qu ick fox jum ped over the lazy d o g")
removeWhiteSpace(&input)
print(result)
print(input)
