//
//  줄세우기.swift
//  algo-swift-MCU
//
//  Created by 김민재 on 11/13/23.
//

import Foundation


let n = Int(readLine()!)!

var nums: [Int] = []
for _ in 0..<n {
    let num = Int(readLine()!)!
    nums.append(num)
}

var dp = Array(repeating: 1, count: n)

for i in 0..<n {
    
    for j in 0..<i {
        if nums[j] < nums[i] {
            dp[i] = max(dp[i], dp[j] + 1)
        }
    }
    
}

print(n - dp.max()!)
