//
//  괄호 회전하기.swift
//  algo-swift-MCU
//
//  Created by 김민재 on 10/3/23.
//

import Foundation

func checkIsRight(_ str: [Character]) -> Bool {

    var stack: [Character] = []
    for s in str {
        if s == "[" || s == "(" || s == "{" {
            stack.append(s)
        } else if s == "]" {
            if !stack.isEmpty && stack.last! == "[" {
                stack.removeLast()
            } else {
                return false
            }
        } else if s == ")" {
            if !stack.isEmpty && stack.last! == "(" {
                stack.removeLast()
            } else {
                return false
            }
        } else if s == "}" {
            if !stack.isEmpty && stack.last! == "{" {
                stack.removeLast()
            } else {
                return false
            }
        }

    }

    return stack.isEmpty
}

func solution(_ s:String) -> Int {

    var s = Array(s)
    var ans = 0
    for _ in 0..<s.count {
        // rotate
        let tmp = s.removeFirst()
        s.append(tmp)

        if checkIsRight(s) {
            ans += 1

        }
    }

    return ans
}
