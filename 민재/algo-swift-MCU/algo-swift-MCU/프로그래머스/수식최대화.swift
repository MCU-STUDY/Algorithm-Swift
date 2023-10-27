//
//  수식최대화.swift
//  algo-swift-MCU
//
//  Created by 김민재 on 10/25/23.
//

import Foundation



func solution(_ expression:String) -> Int64 {
    var opSet = Array(Set(expression.filter { !$0.isNumber })).map { String($0) }
    
    var candi: [[String]] = []
    func permu(n: Int, r: Int, depth: Int) {
        if depth == r {
            candi.append(opSet)
            return
        }

        for i in depth..<n {
            opSet.swapAt(i, depth)
            permu(n: n, r: r, depth: depth+1)
            opSet.swapAt(i, depth)
        }
    }
    
    permu(n: opSet.count, r: opSet.count, depth: 0)
    
    var nums: [Int] = []
    var ops: [String] = []
    
    var tmp = ""
    for exp in expression {
        if !exp.isNumber {
            ops.append(String(exp))
            nums.append(Int(tmp)!)
            tmp = ""
        } else {
            tmp += String(exp)
        }
    }
    
    if tmp != "" {
        nums.append(Int(tmp)!)
    }
    
    var numsCopy = nums
    var opsCopy = ops
    
    var answer: Int64 = 0
    for can in candi {
        for c in can {

            while let opIdx = ops.firstIndex(of: c) {
                var result = 0
                switch c {
                    case "+":
                    result = nums[opIdx] + nums[opIdx+1]
                    case "-":
                    result = nums[opIdx] - nums[opIdx+1]
                    case "*":
                    result = nums[opIdx] * nums[opIdx+1]
                    default: break
                }
                nums[opIdx] = result
                nums.remove(at: opIdx + 1)
                ops.remove(at: opIdx)
                
            }
        }
        answer = max(Int64(abs(nums[0])), answer)
        nums = numsCopy
        ops = opsCopy
    }
    
    return answer
}
