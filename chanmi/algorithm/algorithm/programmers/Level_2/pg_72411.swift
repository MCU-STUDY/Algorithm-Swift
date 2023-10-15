//
//  pg_72411.swift
//  algorithm
//
//  Created by 황찬미 on 2023/10/15.
//
//  메뉴 리뉴얼
//  https://school.programmers.co.kr/learn/courses/30/lessons/72411

import Foundation

func solution(_ orders:[String], _ course:[Int]) -> [String] {
    // 코스요리 최소 2가지 이상 단품메뉴
    // 최소 2명 이상 손님으로부터 주문된 단품메뉴만 메뉴 후보
    
    var dic = [String:Int]()
    var result = [String]()
    
    func dfs(index: Int, depth: Int, now: String, array: [String]) {
        if now.count == depth {
            let sortedStr = String(now.sorted())
            dic[sortedStr, default: 0] += 1
            return
        }
        
        for i in index..<array.count {
            dfs(index: i+1, depth: depth, now: now+array[i], array: array)
        }
    }
    
    for i in course {
        for order in orders {
            let orderArray = Array(order).map{String($0)}
            
            if orderArray.count < i { continue }
            
            dfs(index: 0, depth: i, now: "", array: orderArray)
        }
        
        let maxValue = dic.values.max()!
        if maxValue == 1 { continue }
        
        dic.keys.filter { dic[$0] == maxValue }.forEach {
            result.append($0)
        }
        
        result.sort()
        
        dic = [:]
    }
    
    return result
}

_ = solution(["ABCFG", "AC", "CDE", "ACDE", "BCFG", "ACDEH"], [2,3,4])
