//
//  시소 짝꿍.swift
//  algo-swift-MCU
//
//  Created by 김민재 on 10/3/23.
//

import Foundation

func solution(_ weights:[Int]) -> Int64 {
    var dict: [Int: Int] = [:]

    for weight in weights {
        if dict[weight] != nil {
            dict[weight]! += 1
        } else {
            dict[weight] = 1
        }
    }

    let ratio: [(Int, Int)] = [(1,2), (2,3), (3,4)]

    var answer = 0

    for item in dict {
        let n = item.1
        answer += n * (n-1) / 2 // nC2

        let w = item.0
        for r in ratio {
            let pair = w * r.1 / r.0
            if w % r.0 == 0 && dict[pair] != nil {
                answer += n * dict[pair]!
            }
        }
    }



    return Int64(answer)
}
