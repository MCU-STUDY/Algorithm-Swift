//
//  가장 긴 팰린드롬.swift
//  algo-swift-MCU
//
//  Created by 김민재 on 10/8/23.
//

import Foundation

func solution(_ s:String) -> Int {
    var s = Array(s)
    let n = s.count
    var answer = 1

    for length in (1...n).reversed() {
        for left in (0...n - length) {
            let right = left + length - 1

            var flag = true
            for i in 0..<length/2 {
                if s[left + i] != s[right - i] {
                    flag = false
                    break
                }
            }

            if flag {
                return length
            }

        }
    }

    return answer
}
