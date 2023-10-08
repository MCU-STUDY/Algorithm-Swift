//
//  프로그래머스 괄호 회전하기.swift
//  6week
//
//  Created by uiskim on 2023/09/09.
//

import Foundation

func isCorrect(_ input: [Character]) -> Bool {
    let dic: [Character: Character] = ["(":")", "[":"]", "{":"}"]
    var stack: [Character] = []
    
    /// element가 여는녀석일때는 append()
    /// element가 닫는녀석일때는 removeLast()
    for element in input {
        if !stack.isEmpty && element == dic[stack.last!] {
            stack.removeLast()
        } else {
            stack.append(element)
        }
    }
    return stack.isEmpty
}

func solution(_ s:String) -> Int {
    var count = 0
    var input = Array(s)
    for _ in 0..<s.count {
       if isCorrect(input) {
           count += 1
       }
        
        input.append(input.removeFirst())
    }
    return count
}
