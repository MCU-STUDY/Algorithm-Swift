//
//  연속합.swift
//  algo-swift-MCU
//  https://www.acmicpc.net/problem/1912
//  Created by 김민재 on 11/17/23.
//

import Foundation

let n = Int(readLine()!)!
var nums = readLine()!.split(separator: " ").map { Int($0)! }

var prefix = Array(repeating: -1000, count: n+1)

for i in 0..<n {
    prefix[i+1] = max(prefix[i] + nums[i], nums[i])
}

print(prefix.max()!)
