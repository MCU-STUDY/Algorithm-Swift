//
//  pg_68935.swift
//  algorithm
//
//  Created by 황찬미 on 2023/10/05.
//
//  3진법 뒤집기
//  https://school.programmers.co.kr/learn/courses/30/lessons/68935

import Foundation

func solution(_ n:Int) -> Int {
    return Int(String(String(n, radix: 3).reversed()), radix: 3)!
}

_ = solution(45))
