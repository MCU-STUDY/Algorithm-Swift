//
//  pg_.swift
//  algorithm
//
//  Created by 황찬미 on 2023/10/08.
//
//  가장 긴 팰린드롬
//  https://school.programmers.co.kr/learn/courses/30/lessons/12904

import Foundation

func solution(_ s:String) -> Int {
    let array = Array(s).map{String($0)}
    
    // 팰린드롬이 하나도 없을 경우를 대비해 기존값을 1로 줌
    var answer = 1
    var count = 0

    for i in 0..<array.count-1 {
        for j in stride(from: array.count-1, to: i, by: -1) {
            var left = i
            var right = j
            
            var length = j-i+1
            
            if length < answer { continue }
            
            count = 0
            
            while array[left] == array[right] && left <= right {
                
                if left == right {
                    count += 1
                } else {
                    count += 2
                }
                
                left += 1
                right -= 1
            }
            
            // 처음에 이 조건을 걸지 않았더니,
            // ecdabbcadc 이러한 case에서 6이라는 값이 나옴 cda cda
            // 그래서 left > right라는 조건을 명시
            if left > right { answer = max(answer, count) }
        }
    }

    return answer
}

_ = solution("abcdcba")
