//
//  롤케이크 자르기.swift
//  algo-swift-MCU
//
//  Created by 김민재 on 10/11/23.
//

import Foundation

func solution(_ topping:[Int]) -> Int {
    var answer = 0
    // Key: 토핑, Value: Key토핑 개수
    var dict: [Int: Int] = [:] // 오른쪽 집합에 남아있게 될 토핑들, dict.count == 오른쪽 집합의 토핑의 종류
    for top in topping {
        dict[top, default: 0] += 1
    }
    
    var leftSet = Set<Int>()
    for top in topping {
        leftSet.insert(top)
        
        dict[top]! -= 1 // 왼쪽부터 돌면서 전체에서 빼면 dict에 남는 것은 오른쪽 집합것 뿐.
        if dict[top]! == 0 {
            dict[top] = nil // 토핑 개수가 0이 되면 dict에서 완전히 지워저야 dict의 count값을 "토핑의 종류 개수"로 삼을 수 있음.
        }
        
        if dict.count == leftSet.count { // 오른쪽 토핑의 종류 == 왼쪽 토핑의 종류 ?
            answer += 1
        }
        
    }
    
    return answer
}
