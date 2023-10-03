//
//  pg_43164.swift
//  algorithm
//
//  Created by 황찬미 on 2023/09/14.
//
//  여행경로
//  https://school.programmers.co.kr/learn/courses/30/lessons/43164

import Foundation

func solution(_ tickets:[[String]]) -> [String] {
    // 애초에 tickets 자체를 정렬하기
    let sortedTickets = tickets.sorted(by: { $0[1] < $1[1]})
    var visited = Array(repeating: false, count: tickets.count)
    var result = [String]()
    
    func bfs(_ start: String) {
        // 재귀 탈출 조건
        if result.count == tickets.count {
            result.append(start)
            return
        } else {
            for i in 0..<tickets.count {
                if !visited[i] && start == sortedTickets[i][0] {
                    // 도착지
                    result.append(start)
                    // 방문 처리
                    visited[i] = true
                    
                    bfs(sortedTickets[i][1])
                    
                    if result.count == tickets.count+1 {
                        // 완성됨
                        return
                    }
                    
                    result.removeLast()
                    visited[i] = false
                }
            }
        }
    }
    
    bfs("ICN")
    
    return result
}

print(solution([["ICN", "SFO"], ["ICN", "ATL"], ["SFO", "ATL"], ["ATL", "ICN"], ["ATL","SFO"]]))
