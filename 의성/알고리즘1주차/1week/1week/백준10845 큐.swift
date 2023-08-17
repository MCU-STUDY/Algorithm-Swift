//
//  백준10845 큐.swift
//  1week
//
//  Created by uiskim on 2023/08/07.
//

import Foundation

struct Queue {
    private var stackForEnqueue: [Int] = []
    private var stackForDequeue: [Int] = []
    
    mutating func push(_ element: Int) {
        stackForEnqueue.append(element)
    }
    
    mutating func pop() -> Int {
        if stackForDequeue.isEmpty {
            stackForDequeue = stackForEnqueue.reversed()
            stackForEnqueue.removeAll()
        }
        return stackForDequeue.popLast() ?? -1
    }
    
    var size: Int {
        stackForEnqueue.count + stackForDequeue.count
    }
    
    var empty: Int {
        return (stackForDequeue.isEmpty && stackForEnqueue.isEmpty) ? 1 : 0
    }
    
    /// front는 dequeue기준으로 잡아야함
    /// 왜냐면 enqueue기준으로 잡으면 dequeue가 비어있고 enqueue에만 element가있을때 분기처리를 또해줘야함
    var front: Int {
        var returnValue = stackForDequeue.isEmpty ? stackForEnqueue.first : stackForDequeue.last
        return returnValue ?? -1
    }
    
    /// front를 enqueue로 잡을 경우에 경우의 수를 한가지더 고려해야함....굳이이렇게하진 않아도될듯싶다...
//    var front: Int {
//        if stackForEnqueue.isEmpty {
//            return stackForDequeue.last ?? -1
//        } else {
//            if stackForDequeue.isEmpty {
//                return stackForEnqueue.first ?? -1
//            } else {
//                return stackForDequeue.last ?? -1
//            }
//        }
//    }
    
    
    var back: Int {
        var returnValue = stackForEnqueue.isEmpty ? stackForDequeue.first : stackForEnqueue.last
        return returnValue ?? -1
    }
}

var times: Int = Int(readLine()!)!

var queue = Queue()

for _ in 0..<times {
    let command = readLine()!.split(separator: " ").map{ $0 }
    switch command[0] {
    case "push":
        queue.push(Int(command[1])!)
    case "pop":
        print(queue.pop())
    case "size":
        print(queue.size)
    case "empty":
        print(queue.empty)
    case "front":
        print(queue.front)
    case "back":
        print(queue.back)
    default:
        break
    }
}
