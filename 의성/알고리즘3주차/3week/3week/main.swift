//
//  main.swift
//  3week
//
//  Created by uiskim on 2023/08/22.
//

//import Foundation
//
//let commands = readLine()!.split(separator: " ").map{Int(String($0))!}
//let zimsCount = commands[0]
//let maxWeight = commands[1]
//var zims: [(weight: Int, value: Int)] = [(0,0)]
//
//for _ in 0..<zimsCount {
//    let zim = readLine()!.split(separator: " ").map{Int(String($0))!}
//    zims.append((zim[0], zim[1]))
//}
//
//var dp = Array(repeating: Array(repeating: 0, count: zimsCount+1), count: maxWeight+1)
//
//for index in 1...zimsCount {
//    for weight in 1...maxWeight {
//        if weight < zims[index].weight {
//            dp[weight][index] = dp[weight][index-1]
//        } else {
//            dp[weight][index] = max(dp[weight][index-1], dp[weight-zims[index].weight][index-1]+zims[index].value)
//        }
//    }
//}
//
//print(dp[maxWeight][zimsCount])


import Foundation

//func solution(_ gems:[String]) -> [Int] {
//    let numberOfGems = gems.count
//    let numberOfTypes = Set(gems).count
//
//    if numberOfTypes == 1 {
//        return [1,1]
//    }
//
//    var gemDict: [String:Int] = [gems[0]:1]
//
//    var start = 0
//    var end = 0
//    var len = 100000
//    var results: [Int] = [0,0]
//
//    while true {
//        if gemDict.count == numberOfTypes {
//            let tempLen = end-start
//            if len > tempLen {
//                results = [start+1, end+1]
//                len = tempLen
//            }
//
//            let willRemoveValue = gems[start]
//            if gemDict[willRemoveValue]! == 1 {
//                gemDict.removeValue(forKey: willRemoveValue)
//            } else {
//                gemDict[willRemoveValue]! -= 1
//            }
//            start += 1
//        } else {
//            end += 1
//            if end == numberOfGems {
//                break
//            }
//            let willAppendValue = gems[end]
//            gemDict[willAppendValue, default: 0] += 1
//        }
//    }
//    return [results[0],results[1]]
//}
//
//print(solution(["DIA", "RUBY", "RUBY", "DIA", "DIA", "EMERALD", "SAPPHIRE", "DIA"]))

//let size = Int(readLine()!)!
//let numbers = readLine()!.split(separator: " ").map{Int(String($0))!}
//
//var dp = Array(repeating: 1, count: numbers.count+10)
///// dp[i] index가 1일때까지의 최장길이 수열의 갯수
//for i in 1..<size {
//    for j in 0..<i {
//        if numbers[i] > numbers[j] {
//            /// 원래있던값이랑 새로운값중에 큰걸선택한다
//            dp[i] = max(dp[i], dp[j]+1)
//        }
//    }
//}
//
//print(dp.max()!)
//let commands = readLine()!.split(separator: " ").map{Int(String($0))!}
//let length = commands[0]
//let loops = commands[1]
//let intArray = readLine()!.split(separator: " ").map{Int(String($0))!}
//var dp = Array(repeating: 0, count: length+10)
//
//dp[0] = intArray[0]
//for i in 1..<length {
//    dp[i] = dp[i-1]+intArray[i]
//}
//
//for _ in 0..<loops {
//    let startAndEnd = readLine()!.split(separator: " ").map{Int(String($0))!}
//    let start = startAndEnd[0] - 1
//    let end = startAndEnd[1] - 1
//    if start == 0 {
//        print(dp[end])
//    } else {
//        print(dp[end] - dp[start-1])
//    }
//}
//let commands = readLine()!.split(separator: " ").map{Int(String($0))!}
//
//let n = commands[0]
//let m = commands[1]
//var inputArray: [[Int]] = [Array(repeating: 0, count: n+1)]
//
//for _ in 0..<n {
//    inputArray.append([0]+readLine()!.split(separator: " ").map{Int(String($0))!})
//}
//
//
//var dp = Array(repeating: Array(repeating: 0, count: n+1), count: n+1)
//
//for y in 1...n {
//    for x in 1...n {
//        dp[y][x] = dp[y-1][x] + dp[y][x-1] - dp[y-1][x-1] + inputArray[y][x]
//    }
//}
//
//for _ in 0..<m {
//    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
//    let y1 = input[0]
//    let x1 = input[1]
//    let y2 = input[2]
//    let x2 = input[3]
//    print(dp[y2][x2] - dp[y2][x1-1] - dp[y1-1][x2] + dp[y1-1][x1-1])
//}

print([1,2,3,4,5,6,7,8,9,10,11] + [-2,-2,1,0,0,2,-1,0,0,0])
