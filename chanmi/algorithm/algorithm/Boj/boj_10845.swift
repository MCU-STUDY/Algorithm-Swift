//
//  boj_10845.swift
//  algorithm
//
//  Created by 황찬미 on 2023/08/08.
//
//  큐
//  https://www.acmicpc.net/problem/10845

import Foundation

struct IndexQueue {
    private var index = 0
    private var queue: [Int] = []
    
    public var size: Int {
        queue.count-index
    }
    
    public var empty: Int {
        queue.count == index ? 1 : 0
    }
    
    public var front: Int {
        index < queue.count ? queue[index] : -1
    }
    
    public var back: Int {
        index < queue.count ? queue[queue.count-1] : -1
    }
    
    public mutating func push(_ element: Int) {
        queue.append(element)
    }
    
    /// O(1)
    /// deuque 메서드가 실행될 때, 맨 앞의 데이터가 제거되는 것이 아닌,
    /// 0부터 시작하는 index 값을 증가시키면서 인덱스가 가리키는 값을 리턴한다.
    /// queue의 개수보다 index의 값이 더 클 경우, queue가 비어 있는 것이기 때문에 nil 리턴.
    public mutating func pop() -> Int {
        if index < queue.count {
            let now = queue[index]
            index += 1
            return now
        } else {
            return -1
        }
    }
}

let input = Int(readLine()!)!
var queue = IndexQueue()

for _ in 0..<input {
    let command = readLine()!.split(separator: " ").map{String($0)}
    
    if command[0] == "push" {
        let data = Int(command[1])!
        queue.push(data)
    } else if command[0] == "front" {
        print(queue.front)
    } else if command[0] == "back" {
        print(queue.back)
    } else if command[0] == "size" {
        print(queue.size)
    } else if command[0] == "empty" {
        print(queue.empty)
    } else {
        print(queue.pop())
    }
}

// 메모리 : 79652 KB, 시간 : 32 ms
// 문제 푼 시간 : 15분
