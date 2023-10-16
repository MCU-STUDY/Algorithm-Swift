//
//  pg_131130.swift
//  algorithm
//
//  Created by 황찬미 on 2023/10/06.
//
//  혼자 놀기의 달인
//  https://school.programmers.co.kr/learn/courses/30/lessons/131130

import Foundation

func solution(_ cards:[Int]) -> Int {
    var visited = Array(repeating: false, count: cards.count)
    var array = Array(repeating: [Int](), count: 102)
    var index = 0
    
    for i in 0..<cards.count {
        var i = i
        // 이미 다른 상자에 들어간 카드
        if visited[i] { continue }
        
        while true {
            // 이미 상자에 들어가 있는 카드
            if visited[i] { break }
            visited[i] = true
            
            let card = cards[i]
            array[index].append(card)
            i = card-1
        }
        
        index += 1
    }
    
    let sortedArray = array.sorted { $0.count > $1.count }

    return sortedArray[0].count * sortedArray[1].count
}

_ = solution([8,6,3,7,2,5,1,4])
