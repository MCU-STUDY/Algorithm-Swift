//
//  pg_118667.swift
//  algorithm
//
//  Created by 황찬미 on 2023/10/16.
//
//  두 큐 합 같게 만들기
//  https://school.programmers.co.kr/learn/courses/30/lessons/118667#

import Foundation

func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    
    var queue1Sum = queue1.reduce(0, +)
    var queue2Sum = queue2.reduce(0, +)
    let totalSum = queue1Sum + queue2Sum
    
    var queue1 = queue1
    var queue2 = queue2
    
    let sum = totalSum/2
    
    var queue1Index = 0
    var queue2Index = 0
    
    var result = 0

    let queueCount = (queue1.count+queue2.count)*2
    
    // while문이 끝나는 조건 찾귀
    while queue1Sum != queue2Sum && result < queueCount {
        // queue1Sum이 더 크다면 원소를 빼고, queue2에 넣기
        if queue1Sum > sum {
            queue1Sum -= queue1[queue1Index]
            queue2Sum += queue1[queue1Index]
            
            queue2.append(queue1[queue1Index])
            queue1Index += 1
        } else if queue1Sum < sum {
            queue1Sum += queue2[queue2Index]
            queue2Sum -= queue2[queue2Index]
            
            queue1.append((queue2[queue2Index]))
            queue2Index += 1
        }
        
        result += 1
    }
    
    return queue1Sum == queue2Sum ? result : -1
}

_ solution([3, 2, 7, 2], [4, 6, 5, 1])
