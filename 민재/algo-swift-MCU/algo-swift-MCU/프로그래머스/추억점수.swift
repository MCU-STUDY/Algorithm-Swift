//
//  추억점수.swift
//  algo-swift-MCU
//
//  Created by 김민재 on 10/25/23.
//

import Foundation

func solution(_ name:[String], _ yearning:[Int], _ photo:[[String]]) -> [Int] {
    var dict: [String: Int] = [:]
    for (idx, name) in name.enumerated() {
        dict[name, default: 0] = yearning[idx]
    }
    
    var answer: [Int] = []
    for pic in photo {
        var score = 0
        for name in pic {
            if let yearn = dict[name] {
                score += yearn
            }
        }
        answer.append(score)
    }
    
    return answer
}
