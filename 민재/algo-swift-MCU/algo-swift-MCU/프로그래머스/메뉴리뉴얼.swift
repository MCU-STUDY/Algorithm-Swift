//
//  메뉴리뉴얼.swift
//  algo-swift-MCU
//
//  Created by 김민재 on 10/25/23.
//

import Foundation

func solution(_ orders:[String], _ course:[Int]) -> [String] {
    
    var dict: [String: Int] = [:]
    
    func combi(_ str: [String], _ target: Int) {
        let n = str.count
        
        func comb(_ index: Int, _ depth: Int, _ tempStr: String) {
            if depth == target {
                dict[tempStr, default: 0] += 1
            }
            
            for i in index..<n {
                comb(i+1, depth + 1, tempStr + String(str[i]))
            }
        }
        comb(0, 0, "")
    }
    
    
    var answer: [String] = []
    
    for c in course {
        let target = c
        
        for order in orders {
            if order.count < target { continue }
            // 조합
            let s = Array(order).map { String($0) }.sorted(by: <)
            combi(s, target)
        }
        // print(dict)
        var maxVal = 0
        for dic in dict {
            maxVal = max(maxVal, dic.1)
        }
        for dic in dict {
            let key = dic.0
            let value = dic.1
            if maxVal == value && value >= 2 {
                answer.append(key)
            }
        }
        dict = [:]
    }
    // print(answer)
    
    return answer.sorted()
}
