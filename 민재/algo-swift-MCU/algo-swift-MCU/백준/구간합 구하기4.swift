//
//  구간합 구하기4.swift
//  algo-swift-MCU
//  https://www.acmicpc.net/problem/11659
//  Created by 김민재 on 11/17/23.
//

import Foundation


let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]

var nums = readLine()!.split(separator: " ").map { Int($0)! }

var prefixRange: [[Int]] = []
for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    
    prefixRange.append(input)
}

var prefix = Array(repeating: 0, count: n+1)

for i in 1...n {
    prefix[i] = prefix[i-1] + nums[i-1]
}


for range in prefixRange {
    let i = range[0]
    let j = range[1]
    
    print(prefix[j] - prefix[i-1])
}
