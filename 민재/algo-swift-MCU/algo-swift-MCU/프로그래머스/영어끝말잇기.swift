//
//  영어끝말잇기.swift
//  algo-swift-MCU
//
//  Created by 김민재 on 10/8/23.
//

import Foundation

func solution(_ n:Int, _ words:[String]) -> [Int] {
    var history = Set<String>()

    var last = String(words[0].first!)
    var loser = 0
    var stage = 0
    for i in 0..<words.count {
        var w = Array(words[i]).map { String($0) }
        let str = w.joined(separator: "")
        if w[0] != last || history.contains(str) {
            loser = i % n + 1 // 1

            if (i + 1) % n == 0 {
                stage = (i + 1) / n
            } else {
                stage = (i + 1) / n + 1
            }
            // stage = (i + 1) / n + 1
            break
        }

        history.insert(str)
        last = w[w.count - 1]
    }

    return [loser, stage]
}
