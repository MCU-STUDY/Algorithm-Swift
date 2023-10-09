//
//  숫자 게임.swift
//  algo-swift-MCU
//
//  Created by 김민재 on 10/9/23.
//

import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int { // O(n)
    // dp
    var a = a.sorted(by: >)
    var b = b.sorted(by: >)


    var aIdx = 0
    var bIdx = 0

    var answer = 0
    while aIdx < a.count {

        if b[bIdx] > a[aIdx] { // b가 a보다 크다면 승
            bIdx += 1 // 이미 낸 숫자는 끝
            answer += 1
        }

        aIdx += 1 // 안크다면 큰수 안내고 아끼기
    }




    return answer
}
