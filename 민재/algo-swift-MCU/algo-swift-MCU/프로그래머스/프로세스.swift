//
//  프로세스.swift
//  algo-swift-MCU
//
//  Created by 김민재 on 10/25/23.
//

import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    
//     let maxP = priorities.max()!
    
//     if priorities[location] == maxP {
//         return priorities.filter { $0 == maxP }.count
//     }
    
    var q = priorities
    var qIdx = 0
    
    var curr = location
    var turn = 0
    
    while qIdx < q.count {
        let pop = q[qIdx]
        let maxP = q[qIdx...].max()!
        if pop != maxP {
            
            q.append(pop)
            if qIdx == curr {
                curr = q.count - 1
            }
        } else {
            turn += 1
            if qIdx == curr { break }
        }
        
        qIdx += 1
    }
    
    
    return turn
}
