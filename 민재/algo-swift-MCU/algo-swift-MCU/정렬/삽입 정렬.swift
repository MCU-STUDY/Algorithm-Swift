//
//  삽입 정렬.swift
//  algo-swift-MCU
//
//  Created by 김민재 on 10/3/23.
//

import Foundation


var nums = [10, 1, 7, 8, 5, 9, 2, 4, 6, 3]

// 삽입 정렬
for i in 1..<nums.count {
    for j in stride(from: i, to: 0, by: -1) {
        if nums[j-1] > nums[j] {
            nums.swapAt(j-1, j)
        } else {
            break
        }
    }
}

print(nums)
