//
//  pg_12914.swift
//  algorithm
//
//  Created by 황찬미 on 2023/10/05.
//
//  멀리 뛰기
//  https://school.programmers.co.kr/learn/courses/30/lessons/12914
//
//  1234567 나눠 주어야 하는 이유 -> https://mimiios.tistory.com/13
//  실제 문제의 solution 함수 return값이 Int64이지만, Int로 해도 무관함

import Foundation

func solution(_ n:Int) -> Int {
    var dp = Array(repeating: 0, count: n+2)
    dp[1] = 1
    dp[2] = 2
    
    if n >= 3 {
        for index in 3...n {
            dp[index] = (dp[index-1] + dp[index-2]) % 1234567
        }
    }
    
    return dp[n]
}

_ = solution(4)
