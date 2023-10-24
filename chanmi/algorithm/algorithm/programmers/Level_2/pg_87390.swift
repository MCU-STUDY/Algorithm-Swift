//
//  pg_87390.swift
//  algorithm
//
//  Created by 황찬미 on 2023/10/20.
//
//  n^2 배열 자르기
//  https://school.programmers.co.kr/learn/courses/30/lessons/87390

import Foundation

func solution(_ n:Int, _ left:Int64, _ right:Int64) -> [Int] {
    
    var result = [Int]()
    
    for i in Int(left)...Int(right) {
        result.append(max(i/n+1, i%n+1))
    }
    
    return result
}

_ = solution(3, 2, 5)
