//
//  프로그래머스 여행경로.swift
//  7week
//
//  Created by uiskim on 2023/09/19.
//

import Foundation

/// 강제로 배열 형태로 만들어줘야함(그래프 형태가 아님)
/// 틀린 경로라면 다시 돌아와서 탐색해줘야함(초기화가 필요함)
/// 중복이면 안댐(isVisited배열 필요함)

func solution(_ tickets:[[String]]) -> [String] {
    var isVisited = Array(repeating: false, count: tickets.count)
    var sortedTickets = tickets.sorted{ $0[1] < $1[1] }
    print(sortedTickets)
    
    var results: [String] = []
    
    func dfs(_ input: String) {
        /// 요소로 for문을 돌리기에는 index를 알수가없어서 isVisited의 index를 찾기가 어려워짐
        for index in 0..<sortedTickets.count {
            let start = sortedTickets[index][0]
            let end = sortedTickets[index][1]
            
            if results.count == tickets.count {
                results.append(input)
                return
            }

            if start == input && !isVisited[index] {
                isVisited[index] = true
                results.append(input)
                dfs(end)
                
                /// dfs가 끝날때 만족을 했으면 계속 return이 불려서 dfs뒤쪽 코드가 실행될리가 없음
                /// 만약에 조건을 만족하지 않으면 isVisited조건을 만족못해서 끝나니까 조건을 만족하지 못하는 결과를 반환하게된다
                /// 조건문을 만족하지 못한다는 의미는 dfs가 끝날때 다시 원래 상태로 돌려줘야된다는 의미가 된다
                
                /// 근데 dfs이후코드가 생겨버렸으니 조건을 만족헀는데도 실행될수있음 그래서 조건 필요
                /// append를 하고 return햇으니까 +1이어야함
                if tickets.count + 1 == results.count {
                    return
                }
                
                isVisited[index] = false
                results.removeLast()
                
            }
        }
    }
    
    dfs("ICN")
    
    return results
}
