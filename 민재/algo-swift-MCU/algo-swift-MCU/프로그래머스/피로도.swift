//
//  피로도.swift
//  algo-swift-MCU
//
//  Created by 김민재 on 10/3/23.
//

import Foundation

func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {

    var answer = 0

    var done = Array(repeating: false, count: 8)
    func bt(_ k: Int, _ count: Int) {
        answer = max(answer, count)

        for (i, d) in dungeons.enumerated() {
            let need = d[0]
            let consume = d[1]

            if k < need || done[i] { continue }
            done[i] = true
            bt(k - consume, count + 1)
            done[i] = false
        }
    }


    bt(k, 0)


    return answer
}
