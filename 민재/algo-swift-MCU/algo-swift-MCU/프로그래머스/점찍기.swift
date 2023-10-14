//
//  점찍기.swift
//  algo-swift-MCU
//
//  Created by 김민재 on 10/14/23.
//

import Foundation

func solution(_ k:Int, _ d:Int) -> Int64 {
    var answer: Int64 = 0
    for x in 0...d {
        if x * k > d { break }
        let kx = x * k
        let y = Int64(sqrt(Double(d * d) - Double(kx * kx)))
        answer += y / Int64(k) + 1
    }
    
    
    
    return answer
}
