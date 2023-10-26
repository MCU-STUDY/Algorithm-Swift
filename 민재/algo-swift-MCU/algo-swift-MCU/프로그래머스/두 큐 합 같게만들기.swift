//
//  두 큐 합 같게만들기.swift
//  algo-swift-MCU
//
//  Created by 김민재 on 10/25/23.
//

import Foundation

func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    
    var q1 = queue1
    var qIdx = 0
    var q2 = queue2
    var q2Idx = 0
    
    var sumQ1 = queue1.reduce(0, +)
    var sumQ2 = queue2.reduce(0, +)
    
    let target = (sumQ1 + sumQ2) / 2
    
    var count = 0
    var flag = true
    while sumQ1 != target {
        if count >= (queue1.count + queue2.count) * 2 {
            flag = false
            break
        }
        if sumQ1 < target {
            let popped = q2[q2Idx]
            q2Idx += 1
            q1.append(popped)

            sumQ1 += popped
            sumQ2 -= popped
            
        } else {
            
            let popped = q1[qIdx]
            qIdx += 1
            q2.append(popped)

            sumQ1 -= popped
            sumQ2 += popped
        }
        count += 1
    }
    
    if !flag {
        print(-1)
        return -1
    }
    
    return count
    
}
