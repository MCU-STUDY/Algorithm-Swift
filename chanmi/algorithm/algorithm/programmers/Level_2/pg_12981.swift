//
//  pg_12981.swift
//  algorithm
//
//  Created by 황찬미 on 2023/10/08.
//
//  영어 끝말잇기
//  https://school.programmers.co.kr/learn/courses/30/lessons/12981

import Foundation

func solution(_ n:Int, _ words:[String]) -> [Int] {
    var dic = [String:Bool]()
    
    for i in words {
        dic[i, default: false] = false
    }
    
    dic[words[0]] = true
    
    for i in 1..<words.count {
        let beforeStr = words[i-1]
        let nowStr = words[i]
        
        let endStr = beforeStr[beforeStr.index(before: beforeStr.endIndex)]
        let firstStr = nowStr[nowStr.startIndex]
        if dic[nowStr] == true || endStr != firstStr {
            return [i%n+1, i/n+1]
        }
        
        dic[nowStr] = true
    }
    return [0, 0]
}

_ = solution(3, ["tank", "kick", "know", "wheel", "land", "dream", "mother", "robot", "tank"])
