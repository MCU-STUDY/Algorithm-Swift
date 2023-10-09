//
//  백준 팰린드롬?.swift
//  DP
//
//  Created by uiskim on 2023/10/09.
//

import Foundation

let length = Int(readLine()!)!
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let loop = Int(readLine()!)!

var dp = Array(repeating: Array(repeating: 0, count: length+10), count: length+10)

for i in 0..<length {
    dp[i][i] = 1
}

for i in 0..<length-1 {
    if dp[i] == dp[i+1] {
        dp[i][i+1] = 1
    }
}

for len in 3...length {
    for start in 0...length-len {
        let end = start + len - 1
        if input[start] == input[end] && dp[start+1][end-1] == 1 {
            dp[start][end] = 1
        }
    }
}

for _ in 0..<loop {
    let commands = readLine()!.split(separator: " ").map{Int(String($0))!}
    let start = commands[0]
    let end = commands[1]
    if dp[start-1][end-1] == 1 {
        print(1)
    } else {
        print(0)
    }
}
