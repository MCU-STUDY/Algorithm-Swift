//
//  숨바꼭질 3.swift
//  algo-swift-MCU
//  https://www.acmicpc.net/board/view/38887
//  Created by 김민재 on 12/6/23.
//

import Foundation


let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let k = input[1]


func bfs(_ start: Int) -> Int {
    if start == k {
        return 0
    }
    
    var visited = Array(repeating: false, count: 100001)
    visited[start] = true
    var q = [(start, 0)] // (num, time)
    var qIdx = 0
    
    while qIdx < q.count {
        let pop = q[qIdx]
        let num = pop.0
        let time = pop.1
        qIdx += 1
        
        if num == k {
            return time
        }
        
        for nextNum in [num*2, num-1, num+1] {
            if (0...100000) ~= nextNum && !visited[nextNum] {
                visited[nextNum] = true
                if nextNum == num * 2 {
                    q.append((nextNum, time))
                } else {
                    q.append((nextNum, time + 1))
                }
            }
        }
    }
    return -1
}

print(bfs(n))
