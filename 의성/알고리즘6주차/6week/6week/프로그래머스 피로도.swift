//
//  프로그래머스 피로도.swift
//  6week
//
//  Created by uiskim on 2023/09/09.
//

import Foundation

func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
    var isVisited = Array(repeating: false, count: dungeons.count)
    var results: [Int] = []

    func dfs(_ start: Int, _ pld: Int) {

        for index in 0..<dungeons.count {
            if !isVisited[index] && dungeons[index][0] <= pld {

                isVisited[index] = true
                dfs(start+1, pld - dungeons[index][1])
                results.append(isVisited.filter{$0}.count)
                isVisited[index] = false
            }
        }
    }
    
    dfs(0, k)
    
    return results.max()!
}

// 하루에한번씩 탐험 -> 중복안됨
// 그래프형태로 만들수가 없음 강제로 그래프형태로 만들어줘야함
