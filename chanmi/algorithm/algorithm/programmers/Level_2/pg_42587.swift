//
//  pg_42587.swift
//  algorithm
//
//  Created by 황찬미 on 2023/10/20.
//
//  프로세스 
//  https://school.programmers.co.kr/learn/courses/30/lessons/42587

import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    
    var queue = priorities
    var location = location
    var result = 0
    
    var maxPriority = queue.max()!
    
    while !queue.isEmpty {
        
        // 현재 실행할 큐가 우선순위가 낮다면
        while queue.first! < maxPriority {
            let temp = queue.removeFirst()
            queue.append(temp)
            
            if location == 0 {
                location = queue.count-1
            } else {
                location -= 1
            }
        }
        
        // 우선순위가 높은 프로세스일 경우
        queue.removeFirst()
        result += 1
        
        // 알아야 할 프로세스의 위치 확인
        if location == 0 {
            break
        } else {
            location -= 1
        }
        
        // 새로운 우선순위 뽑기
        maxPriority = queue.max()!
        
    }
    
    return result
}

_ = solution([2, 1, 3, 2], 2)
