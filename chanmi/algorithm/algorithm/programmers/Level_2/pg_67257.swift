//
//  pg_67257.swift
//  algorithm
//
//  Created by 황찬미 on 2023/10/22.
//
//  수식 최대화
//  https://school.programmers.co.kr/learn/courses/30/lessons/67257

import Foundation

func solution(_ expression:String) -> Int64 {
    
    // 연산자는 고정. +, -, *만으로 이루어져 있음.
    let filterOp = expression.components(separatedBy: ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]).filter {$0 != ""}
    let numArray = expression.components(separatedBy: ["+", "-", "*"]).map{Int($0)!}
    
    // 중복 제거
    let opArray = Array(Set(filterOp))
    
    var opArrays = [[String]]()
    var visited = Array(repeating: false, count: opArray.count)
    
    // 수식 경우의 수 만들기
    func permutation(input: [String]) {
        if input.count == opArray.count {
            opArrays.append(input)
            return
        }
        
        for i in 0..<opArray.count {
            if !visited[i] {
                visited[i] = true
                permutation(input: input+[opArray[i]])
                visited[i] = false
            }
        }
    }
    
    func calculate(_ a: Int, _ b: Int, _ op: String) -> Int {
        switch op {
            case "+":
            return a+b
            case "-":
            return a-b
            case "*":
            return a*b
            default:
            return 0
        }
    }
    
    permutation(input: [])
    
    var result = 0
    
    for opArray in opArrays {
        // [["-", "*", "+"], ["-", "+", "*"], ["*", "-", "+"], ["*", "+", "-"], ["+", "-", "*"], ["+", "*", "-"]]
        
        var filterOp = filterOp
        var numArray = numArray
        
        for op in opArray {
            for _ in 0..<filterOp.count {
                if let temp = filterOp.firstIndex(of: op) {
                    numArray[temp] = calculate(numArray[temp], numArray[temp+1], op)
                    
                    filterOp.remove(at: temp)
                    numArray.remove(at: temp+1)
                }
            }
        }
        
        result = max(result, abs(numArray[0]))
    }
    
    return Int64(result)
}

print(solution("50*6-3*2"))
