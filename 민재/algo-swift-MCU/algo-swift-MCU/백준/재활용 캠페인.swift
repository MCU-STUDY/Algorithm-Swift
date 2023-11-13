//
//  재활용 캠페인.swift
//  algo-swift-MCU
//
//  Created by 김민재 on 11/13/23.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0] // 헤어에센스 용기의 수
let x = input[1] // 용기의 총 용량, X/2를 이벤트로 채워준다.

var cs = readLine()!.split(separator: " ").map { Int($0)! }
cs.sort()

var start = 0
var end = n-1

var answer = 0
var remainCnt = 0
while start <= end { // 교차될때까지
    if cs[end] >= x {
        answer += 1
        end -= 1
        continue
    }
    
    if start == end {
        remainCnt += 1
        break
    }
    
    let target: Double = Double(x) / 2
    if Double(cs[start] + cs[end]) >= target {
        start += 1
        end -= 1
        answer += 1
    } else {
        remainCnt += 1
        start += 1
    }
    
}

print(answer + remainCnt / 3)

/*
 7 1
 0 0 0 0 0 0 1
 */
