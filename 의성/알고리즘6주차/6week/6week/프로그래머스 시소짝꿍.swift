//
//  프로그래머스 시소짝꿍.swift
//  6week
//
//  Created by uiskim on 2023/09/09.
//

import Foundation

func solution(_ weights:[Int]) -> Int {
    var answer = 0
    var dict = [Int: Int]()
    let ratio: [(Int, Int)] = [(1, 2), (2, 3), (3, 4)]
    weights.forEach{ dict[$0, default: 0] += 1 }

    for w in dict.keys {
        let x = dict[w]!
        answer += ((x * (x-1))/2)
        for (a, b) in ratio {
            let y = ((w * a)/b)
            if w % b == 0 && dict[y] != nil {
                answer += (x * dict[y]!)
            }
        }
    }

    return answer
}
