//
//  다트 게임.swift
//  algo-swift-MCU
//
//  Created by 김민재 on 10/3/23.
//

import Foundation

func solution(_ dartResult:String) -> Int {

    var scores = dartResult.split { $0.isLetter || $0 == "*" || $0 == "#" }.map { Int($0)! }
    var ops = dartResult.split { $0.isNumber }

    var results = Array(repeating: 0, count: scores.count)
    for i in 0..<scores.count {

        var score = scores[i]
        let op = ops[i]

        for p in op {
            if p == "D" {
                score *= score
            } else if p == "T" {
                var tmp = score
                score *= tmp
                score *= tmp
            } else if p == "*" {
                // 처음
                score *= 2
                if i == 0 {
                    continue
                }
                results[i - 1] *= 2
            } else if p == "#" {
                score *= -1
            }
        }
        results[i] = score
    }

    return results.reduce(0, +)
} Foundation
