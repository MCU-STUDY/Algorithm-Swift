//
//  pg_540654.swift
//  algorithm
//
//  Created by 황찬미 on 2023/10/19.
//
//  불량 사용자
//  https://school.programmers.co.kr/learn/courses/30/lessons/64064

import Foundation

func solution(_ user_id:[String], _ banned_id:[String]) -> Int {
    
    var result = Array(repeating: [String](), count: banned_id.count)
    
    for i in 0..<banned_id.count {
        let id = Array(banned_id[i]).map{String($0)}
        var flag = true
        
        for user in user_id {
            let userMap = Array(user).map{String($0)}
            var index = 0
            
            // 길이가 다르면 탐색할 필요 없음
            if id.count != user.count {
                index += 1
                continue
            }
            
            while index < userMap.count {
                // 일반 아이디
                if id[index] != "*" {
                    if id[index] == userMap[index] {
                        index += 1
                        // 통과
                    } else {
                        flag = false
                        break
                    }
                } else {
                    index += 1
                }
            }
            
            // 조건에 충족했다면
            if flag {
                let userStr = userMap.joined()
                result[i].append(userStr)
            }
            
            // flag 값 복구
            flag = true
        }
    }
    
    var setStr: Set<String> = []
    var setStr2: Set<Set<String>> = []
    
    func dfs(depth: Int) {
        if depth == banned_id.count {
            print(setStr2)
            setStr2.insert(setStr)
            return
        }
        
        for user in result[depth] {
            if !setStr.contains(user) {
                setStr.insert(user)
                dfs(depth: depth+1)
                setStr.remove(user)
            }
        }
    }
    
    dfs(depth: 0)
    
    return setStr2.count
}

print(solution(["frodo", "fradi", "crodo", "abc123", "frodoc"], ["fr*d*", "*rodo", "******", "******"]))

print(solution(["frodo", "fradi", "crodo", "abc123", "frodoc"], ["*rodo", "*rodo", "******"]))

print(solution(["frodo", "fradi", "crodo", "abc123", "frodoc"], ["fr*d*", "abc1**"]))
