//
//  소수찾기.swift
//  algo-swift-MCU
//
//  Created by 김민재 on 10/3/23.
//

import Foundation


func isPrime(_ num: Int) -> Bool {
    if num <= 1 { return false }
    for i in 2..<num {
        if num % i == 0 { return false }
    }
    return true
}

func solution(_ numbers:String) -> Int {
    let nums = Array(numbers)
    var visited = Array(repeating: false, count: nums.count)

    var count = 0

    var havCalculated = Set<Int>()

    func dfs(_ nums: String) {
        if nums.count > 0 && !havCalculated.contains(Int(nums)!) && isPrime(Int(nums)!) {
            havCalculated.insert(Int(nums)!)
            count += 1
        }

        for (i, num) in numbers.enumerated() {
            if !visited[i] {
                visited[i] = true
                dfs(nums + String(num))
                visited[i] = false
            }
        }
    }


    dfs("")

    return count
}
