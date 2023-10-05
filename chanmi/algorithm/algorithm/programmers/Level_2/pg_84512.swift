//
//  pg_84512.swift
//  algorithm
//
//  Created by 황찬미 on 2023/09/08.
//
//  모음사전
//  https://school.programmers.co.kr/learn/courses/30/lessons/84512?language=swift

import Foundation

func solution(_ word:String) -> Int {
    var count = 0
    var str = ""
    var flag = false
    
    func dfs(str: String) {
        if str == word {
            flag = true
            return
        }
        
        if str.count == 5 {
            return
        } else {
            let words = ["A", "E", "I", "O", "U"]
            for i in 0..<5 {
                if flag { return }
                count += 1
                dfs(str: str+words[i])
            }
        }
    }
    
    dfs(str: str)
    
    return count
}
