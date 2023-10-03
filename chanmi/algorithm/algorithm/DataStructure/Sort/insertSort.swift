//
//  insertSort.swift
//  algorithm
//
//  Created by 황찬미 on 2023/09/15.
//

import Foundation

// 1, 2, 6, 7, 8로 정렬되어야 함
var array = [2, 6, 1, 7, 8]

func insertArray(_ array: inout [Int]) -> [Int] {
    // 1번째 index부터 이전 index와 비교
    for i in 1..<array.count {
        for j in stride(from: i, to: 0, by: -1) {
            // 이전값이 앞의 값보다 크다면
            if array[j-1] > array[j] {
                array.swapAt(j-1, j)
            } else {
                // 이후값들은 정렬할 필요 없음
                break
            }
        }
    }
    return array
}

print(insertArray(&array))
