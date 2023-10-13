//
//  pg_140107.swift
//  algorithm
//
//  Created by 황찬미 on 2023/10/13.
//
//  점 찍기
//  https://school.programmers.co.kr/learn/courses/30/lessons/140107

import Foundation

func solution(_ k: Int, _ d: Int) -> Int {
    var count = 0
    for x in stride(from: 0, through: d, by: k) {
        let squrtY = Int(sqrt(Double(d*d-x*x)))
            
        // x, 0 좌표를 포함시켜야 하기 때문에 1을 더함
        count += ((squrtY / k) + 1)
    }
    return count
}
