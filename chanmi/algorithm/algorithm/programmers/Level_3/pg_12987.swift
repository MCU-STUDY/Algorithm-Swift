//
//  pg_12987.swift
//  algorithm
//
//  Created by 황찬미 on 2023/10/09.
//
//  숫자 게임
//  https://school.programmers.co.kr/learn/courses/30/lessons/12987

import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int {
    // a를 이기기 위해서는 b의 가장 작은 수로 이겨야 하기 때문에 정렬
    var sortedA = a.sorted()
    var sortedB = b.sorted()
    
    var index = 0
    var result = 0
    
    for b in sortedB {
        if sortedA[index] < b {
            result += 1
            index += 1
        }
    }
    
    return result
}

_ = solution([5, 1, 3, 7], [2, 2, 6, 8])
