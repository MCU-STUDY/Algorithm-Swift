//
//  마법의 엘리베이터.swift
//  algo-swift-MCU
//
//  Created by 김민재 on 10/25/23.
//

import Foundation

func solution(_ storey: Int) -> Int {
    
    var tmp = storey
    var answer = 0
    var divTen = 10
    while tmp != 0 {
        let left = tmp % 10
        var change = 0
        if left > 5 {
            tmp += 10 - left
            answer += 10 - left
        } else if left < 5 {
            tmp -= left
            answer += left
        } else { // == 5
            
            if (tmp / 10) % 10 >= 5 {
                tmp += left
                answer += left
            } else {
                tmp -= left
                answer += left
            }
        }
        
        tmp /= 10
    }
    
    
    
    return answer
}
