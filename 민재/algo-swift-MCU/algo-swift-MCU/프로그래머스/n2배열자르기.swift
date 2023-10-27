//
//  n.swift
//  algo-swift-MCU
//
//  Created by 김민재 on 10/25/23.
//

import Foundation

func solution(_ n:Int, _ left:Int64, _ right:Int64) -> [Int] {
    var n = Int64(n)
    var fromRow = left / n
    var fromCol = left % n
    
    let toRow = right / n
    let toCol = right % n
    
    var cnt = (toRow * n + toCol) - (fromRow * n + fromCol) + 1
    var answer: [Int] = []
    while cnt != 0 {
        
        if fromCol == n - 1 { // "끝"
            answer.append(Int(n))
            fromCol = 0
            fromRow += 1
            
        } else {
            let t = Int(max(fromRow, fromCol) + 1)
            answer.append(t)
            fromCol += 1
        }
        
        
        cnt -= 1
    }
    
    // print(answer)
    return answer
}
