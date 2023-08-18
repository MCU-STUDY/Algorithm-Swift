//
//  boj_10828.swift
//  algorithm
//
//  Created by 황찬미 on 2023/08/08.
//
//  스택
//  https://www.acmicpc.net/problem/10828

import Foundation

struct Stack {
    private var stack: [Int] = []
    
    public var size: Int {
        stack.count
    }
    
    public var empty: Int {
        stack.isEmpty ? 1 : 0
    }
    
    public var top: Int {
        stack.isEmpty ? -1 : stack.last!
    }
    
    public mutating func push(_ element: Int) {
        stack.append(element)
    }
    
    public mutating func pop() -> Int {
        stack.isEmpty ? -1 : stack.popLast()!
    }
}

let input = Int(readLine()!)!
var stack = Stack()

for _ in 0..<input {
    let command = readLine()!.split(separator: " ").map{String($0)}
    
    if command[0] == "push" {
        let data = Int(command[1])!
        stack.push(data)
    } else if command[0] == "top" {
        print(stack.top)
    } else if command[0] == "size" {
        print(stack.size)
    } else if command[0] == "empty" {
        print(stack.empty)
    } else {
        print(stack.pop())
    }
}

// 메모리 : 79652 KB, 시간 : 32 ms
// 문제 푼 시간 : 5분
