import Foundation

/*
 Best Auction Bids
 Assume you are building a system to track top auction bids for your local community fundraiser.
 As new bids are made, your goal will be to track the number of top bids as they are announced:
 let bids = [2, 1, 9, 4, 8, 6, 10, 5]
 func topBids(bids: [Int]) -> Int {
   //code goes here..
 }
 When organizing data, we sometimes make the assumption correctly sorted data should always be presented in
 ascending or descending order. However, there are many times when the primary objective is find the largest or
 smallest value for a given dataset.
 */

func topBids( _ bids: [Int]) -> Int {
    let start = Date()
    guard bids.count > 0 else { return .zero }
    let m = bids.count
    var topBid = bids.first!
    for i in 1..<m {
        if bids[i] > topBid {
            topBid = bids[i]
        }
    }
    let end = Date()
    let component = Calendar.current.dateComponents([.nanosecond], from: start, to: end)
    let milliseconds = Double(component.nanosecond! / 1000000)
    print("First Algorithm runtime: \(milliseconds)")
    return topBid
}

func topBid( _ bids: [Int]) -> Int {
    let start = Date()
    guard bids.count > 0 else { return .zero }
    let m = bids.count
    var topBid = bids.first!
    var n = 1
    while n < m {
        if bids[n] > topBid {
            topBid = bids[n]
        }
        n += 1
    }
    let end = Date()
    let component = Calendar.current.dateComponents([.nanosecond], from: start, to: end)
    let milliseconds = Double(component.nanosecond! / 1000000)
    print("Second Algorithm runtime: \(milliseconds)")
    return topBid
}

let bids = [2, 1, 9, 4, 8, 6, 10, 5, 12]
print(topBids(bids))
print(topBid(bids))
