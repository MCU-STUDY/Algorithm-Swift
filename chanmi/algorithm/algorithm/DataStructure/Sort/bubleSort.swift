//
//  bubleSort.swift
//  algorithm
//
//  Created by 황찬미 on 2023/09/15.
//

import Foundation

// 1, 2, 6, 7, 8로 정렬되어야 함
var array = [2, 6, 1, 7, 8]

func bubleInsertSort(_ array: inout [Int]) -> [Int] {
    // 배열의 원소 -1 만큼 순회
    for i in 0..<array.count {
        // 정렬된 뒷부분은 비교하지 않아도 되기 때문에 -(i+1)
        for j in 0..<array.count-(i+1) {
            if array[j] > array[j+1] {
                array.swapAt(j, j+1)
            }
        }
    }
    
    return array
}

print(bubleInsertSort(&array))
