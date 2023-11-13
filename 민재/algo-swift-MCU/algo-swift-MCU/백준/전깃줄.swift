//
//  전깃줄.swift
//  algo-swift-MCU
//
//  Created by 김민재 on 11/13/23.
//

import Foundation

/*
 0. B를 A기준으로 정렬
 1. B에서 LIS
 2. 전체 개수 - LIS 길이 빼기
 */

// 8, 2, 9, 1, 4, 6, 7, 10

let n = Int(readLine()!)!

var wires: [[Int]] = []

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    wires.append(input)
}

wires.sort { a, b in
    return a[0] < b[0]
}

let bWires = wires.map { $0[1] }
var dp = Array(repeating: 1, count: n)

for i in 0..<n {
    for j in 0..<i {
        if bWires[j] < bWires[i] {
            dp[i] = max(dp[i], dp[j] + 1)
        }
    }
}

print(n - dp.max()!)
