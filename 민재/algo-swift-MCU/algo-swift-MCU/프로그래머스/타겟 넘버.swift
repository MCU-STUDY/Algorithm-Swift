//
//  타겟 넘버.swift
//  algo-swift-MCU
//
//  Created by 김민재 on 10/3/23.
//

import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {
    let n = numbers.count
    var count = 0
    func dfs(_ accu: Int, _ depth: Int) {
        if depth == n {
            if accu == target {
                count += 1
            }
            return
        }

        let num = numbers[depth]
        dfs(accu + num, depth + 1)
        dfs(accu - num, depth + 1)
    }


    dfs(0, 0)

    return count
}
