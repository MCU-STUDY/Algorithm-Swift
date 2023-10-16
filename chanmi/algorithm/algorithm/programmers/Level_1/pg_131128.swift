//
//  pg_131128.swift
//  algorithm
//
//  Created by 황찬미 on 2023/10/16.
//
//  숫자 짝꿍
//  https://school.programmers.co.kr/learn/courses/30/lessons/131128

import Foundation

func solution(_ X:String, _ Y:String) -> String {
    
    var array = [String]()
    
    for i in "9876543210" {
        let xCount = X.filter { String($0) == String(i) }.count
        let yCount = Y.filter { String($0) == String(i) }.count
        let minCount = min(xCount, yCount)
        
        for _ in 0..<minCount {
            array.append(String(i))
        }
    }
    
    if array.isEmpty {
        return "-1"
    } else if array[0] == "0" {
        return "0"
    } else {
        return array.joined()
    }
}

_ = solution("100", "2345")
