//
//  pg_138476.swift
//  algorithm
//
//  Created by 황찬미 on 2023/10/08.
//
//  귤 고르기
//  https://school.programmers.co.kr/learn/courses/30/lessons/138476

import Foundation

func solution(_ k:Int, _ tangerine:[Int]) -> Int {
    var dic = [Int:Int]()
    
    for i in 0..<tangerine.count {
        let number = tangerine[i]
        
        if let _ = dic[number] {
            dic[number]! += 1
        } else {
            dic[number] = 1
        }
    }
    
    let sortedDic = dic.values.sorted { $0 > $1 }
    
    var k = k
    var count = 0
    
    for i in 0..<sortedDic.count {
        k -= sortedDic[i]
        count += 1
        
        if k <= 0 {
            return count
        }
    }
    
    return count
}

_ = solution(6, [1, 3, 2, 5, 4, 5, 2, 3])
