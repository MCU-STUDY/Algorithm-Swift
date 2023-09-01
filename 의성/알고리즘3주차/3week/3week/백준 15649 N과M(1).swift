//
//  백준 15649 N과M(1).swift
//  3week
//
//  Created by uiskim on 2023/08/31.
//

import Foundation

/// 15649번
/// N과 M(1)

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let lastNumber = input[0]
let numberOfCount = input[1]

var stack: [Int] = []

func dfs() {
    if stack.count == numberOfCount {
        print(stack.map{String($0)}.joined(separator: " "))
        return
    }
    
    for i in 1...lastNumber {
        if !stack.contains(i) {
            stack.append(i)
            dfs()
            stack.removeLast()
        }
    }
}

dfs()

/// isVisited사용
//let input = readLine()!.split(separator: " ").map { Int($0)! }
//let n = input[0], m = input[1]
//var visited = [Bool](repeating: false, count: n + 1)
//
//func dfs(nums: [Int]) {
//    if nums.count == m {
//        nums.forEach { print($0, terminator: " ") }
//        print()
//        return
//    }
//
//    for i in 1...n {
//        if !visited[i] {
//            visited[i] = true
//            dfs(nums: nums + [i])
//            visited[i] = false
//        }
//    }
//}
//
//dfs(nums: [])
