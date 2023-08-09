//
//  백준10828 스택.swift
//  1week
//
//  Created by uiskim on 2023/08/03.
//

import Foundation

// 공통 변수
var count = Int(readLine()!)!

// 1번방법
struct Stack<T> {
    private var stack: [T] = []
    mutating func push(_ element: T) { self.stack.append(element) }
    mutating func pop() -> T? { self.stack.popLast() }
    var peak: T? { self.stack.last }
    var count: Int { self.stack.count }
    var isEmpty: Bool { self.stack.isEmpty }
}

var stack = Stack<Int>()

for _ in 0..<count {
    let commend = readLine()!.split(separator: " ").map{ $0 }
    switch commend[0] {
    case "push":
        let element = Int(commend[1])!
        stack.push(element)
    case "pop":
        print(stack.pop() ?? "-1")
    case "size":
        print(stack.count)
    case "empty":
        print(stack.isEmpty ? 1 : 0)
    case "top":
        print(stack.peak ?? "-1")
    default:
        break
    }
}

// 2번방법
// stack같은 경우에는 내부 메서드 1개를 메서드 1개에 대응시킨 느낌이라 굳이 구조체를 만들 필요가 있나라는 생각이듦
var stackArray: [Int] = []

for _ in 0..<count {
    let commend = readLine()!.split(separator: " ").map{ $0 }
    switch commend[0] {
    case "push":
        stackArray.append(Int(commend[1])!)
    case "pop":
        print(stackArray.popLast() ?? -1)
    case "size":
        print(stackArray.count)
    case "empty":
        print(stackArray.isEmpty ? 1 : 0)
    case "top":
        print(stackArray.last ?? -1)
    default:
        break
    }
}
