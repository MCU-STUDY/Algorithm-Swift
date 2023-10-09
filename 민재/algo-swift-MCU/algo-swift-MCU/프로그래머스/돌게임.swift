//
//  돌게임.swift
//  algo
//
//  Created by 김민재 on 10/8/23.
//

import Foundation


let n = Int(readLine()!)!

//if n % 2 == 0 {
//    print("CY")
//} else {
//    print("SK")
//}


// 0: SK
// 1: CY
var dp = Array(repeating: 0, count: n + 1)

// 돌의 개수 -> 필요한 라운드 횟수

if n >= 4 {
    dp[1] = 1
    dp[2] = 2
    dp[3] = 1

    for i in 4...n {
        dp[i] = min(dp[i - 1], dp[i - 3]) + 1
    }
} else {
//    if n % 2 == 0 {
//        print("CY")
//    } else {
//        print("SK")
//    }
}


if dp[n] % 2 == 0 {
    print("CY")
} else {
    print("SK")
}
