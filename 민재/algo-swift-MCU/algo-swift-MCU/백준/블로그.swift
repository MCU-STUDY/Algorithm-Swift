//
//  블로그.swift
//  algo-swift-MCU
//
//  Created by 김민재 on 11/11/23.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let x = input[1]

var visitors: [Int] = readLine()!.split(separator: " ").map { Int($0)! }

if visitors.max()! == 0 {
    print("SAD")
    exit(0)
}

var sum = visitors[..<x].reduce(0, +)
var maxSum = sum
var count = 1

for i in x..<n {
    sum += visitors[i]
    sum -= visitors[i - x]
    
    if sum > maxSum {
        maxSum = sum
        count = 1
    } else if sum == maxSum {
        count += 1
    }
    
}

print(maxSum)
print(count)
