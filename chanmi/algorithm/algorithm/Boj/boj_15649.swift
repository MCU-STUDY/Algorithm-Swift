//
//  boj_15649.swift
//  algorithm
//
//  Created by 황찬미 on 2023/08/25.
//
//  N과 M (1)
//  https://www.acmicpc.net/problem/15649

let input = readLine()!.split(separator: " ").map{Int($0)!}
let number = input[0]
let count = input[1]
var array: [Int] = []
var visited = Array(repeating: false, count: number+1)

func backTracking(depth: Int) {
    if depth == count {
        print(array.map{String($0)}.joined(separator: " "))
        return
    } else {
        for i in 1...number {
            if !visited[i] {
                visited[i] = true
                array.append(i)
                backTracking(depth: depth+1)
                array.removeLast()
                visited[i] = false
            }
        }
    }
}

backTracking(depth: 0)

// 메모리 : 69108 KB, 시간 : 116 ms
