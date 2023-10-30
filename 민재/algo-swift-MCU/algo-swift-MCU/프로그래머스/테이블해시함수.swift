//
//  테이블해시함수.swift
//  algo-swift-MCU
//
//  Created by 김민재 on 10/30/23.
//

import Foundation

func solution(_ data:[[Int]], _ col:Int, _ row_begin:Int, _ row_end:Int) -> Int {
    
    var data = data.sorted { a, b in
                            if a[col-1] == b[col-1] {
                                return a[0] > b[0]
                            }
                            return a[col-1] < b[col-1]
    }
    
    var modResults: [Int] = []
    for i in (row_begin-1)...(row_end-1) {
        let row = data[i]
        var tmp = 0
        for r in row {
            tmp += r % (i + 1)
        }
        modResults.append(tmp)
    }
    
    var answer = modResults[0]
    for res in modResults[1...] {
        answer ^= res
    }
    
    return answer
}
