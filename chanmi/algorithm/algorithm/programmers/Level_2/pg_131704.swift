//
//  pg_131704.swift
//  algorithm
//
//  Created by 황찬미 on 2023/10/16.
//
//  택배상자
//  https://school.programmers.co.kr/learn/courses/30/lessons/131704#

import Foundation

func solution(_ order:[Int]) -> Int {
    var stack = [Int]()
    var postBox = 1
    
    var index = 0
    var count = 0
    
    while postBox <= order.count {
        // 일단 택배 상자 싣기
        stack.append(postBox)
        
        while let last = stack.last, last == order[index] {
            stack.removeLast()
            index += 1
        }
        
        postBox += 1
    }
    
    return index
}

_ = solution([4, 3, 1, 2, 5])
