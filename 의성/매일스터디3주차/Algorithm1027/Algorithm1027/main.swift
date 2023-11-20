//
//  main.swift
//  Algorithm1027
//
//  Created by uiskim on 2023/10/27.
//

import Foundation
//
//func solution(_ picks: [Int], _ minerals: [String]) -> Int {
//    var result = 25*50
//    var picks = picks
//    let fatigueArray = [[1,1,1],[5,1,1],[25,5,1]]
//    let dict: [String: Int] = ["diamond": 0, "iron": 1, "stone": 2]
//
//    func dfs(_ index: Int, _ fatigue: Int) {
//        if index == minerals.count || picks.reduce(0, +) == 0 {
//            result = min(result, fatigue)
//            return
//        }
//
//        for i in 0..<picks.count {
//            var tempFatigue = 0
//            var picked = 0
//            if picks[i] > 0 {
//                picks[i] -= 1
//
//                for j in index..<index+5 {
//                    if j >= minerals.count {
//                        break
//                    }
//                    tempFatigue += fatigueArray[i][dict[minerals[j]]!]
//                    picked += 1
//                }
//                dfs(index+picked, fatigue+tempFatigue)
//                picks[i] += 1
//            }
//        }
//    }
//
//    dfs(0,0)
//
//
//    return result
//}
//
//let a = solution([0, 1, 1], ["diamond", "diamond", "diamond", "diamond", "diamond", "iron", "iron", "iron", "iron", "iron", "diamond"])
//print(a)


//func solution(_ cards:[Int]) -> Int {
//    var isVisited = Array(repeating: false, count: 1000)
//    var results: [Int] = []
//
//    if cards.count == 2 {
//        return 1
//    }
//
//    func dfs(_ start: Int, _ depth: Int) {
//        if isVisited[cards[start-1]] {
//            results.append(depth)
//            return
//        }
//
//        if !isVisited[cards[start-1]] {
//            isVisited[cards[start-1]] = true
//            dfs(cards[start-1], depth+1)
//        }
//    }
//
//    for i in 1..<cards.count {
//        if !isVisited[i] {
//            dfs(i, 0)
//        }
//    }
//
//    let sortedResults = results.sorted(by: >)
//    if sortedResults.count > 1 {
//        return sortedResults[0] * sortedResults[1]
//    } else {
//        return 0
//    }
//}
//
//print(solution([1,2]))


let length = 2
let startPoints = [6,10,8]
var pointArrays: [[Int]] = []
startPoints.forEach { element in
    let tempArray = Array(element...element+length)
    pointArrays.append(tempArray)
}


var dp = Array(repeating: 1, count: startPoints.count+10)

for i in 1..<startPoints.count {
    var count = 0
    for j in 0..<i {
        print("✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅")
        print("왼쪽\(pointArrays[i])")
        print("오른쪽\(pointArrays[j])")
        print("✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅")
        if !hasInter(pointArrays[i], pointArrays[j]) {
            count += 1
        }
    }
    print(count)
    if count == 0 {
        dp[i] = 1
    } else {
        dp[i] = dp[i-1] + count
    }
    count = 0
}

func hasInter(_ lhs: [Int], _ rhs: [Int]) -> Bool {
    return !Set(lhs).isDisjoint(with: Set(rhs))
}


print(dp[0..<startPoints.count])
