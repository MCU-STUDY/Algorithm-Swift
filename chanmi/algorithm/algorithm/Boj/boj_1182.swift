//
//  boj_1182.swift
//  algorithm
//
//  Created by 황찬미 on 2023/08/25.
//
//  부분수열의 합
//  https://www.acmicpc.net/problem/1182

let input = readLine()!.split(separator: " ").map{Int($0)!}
let array = readLine()!.split(separator: " ").map{Int($0)!}
let n = input[0]
let s = input[1]
var visited = Array(repeating: false, count: n)
var now = 0
var count = 0

func backTracking(start: Int, depth: Int) {
    if now == s && depth >= 1 {
        count += 1
    }
    
    for i in start..<n {
        if !visited[i] {
            visited[i] = true
            now += array[i]
            backTracking(start: i, depth: depth+1)
            now -= array[i]
            visited[i] = false
        }
    }
}

backTracking(start: 0, depth: 0)

print(count)

// 메모리 : 69104 KB, 시간 : 92 ms

/*
 실수한 부분 : if문에 걸리면 함수가 끝나야 한다고 가정하고 코드를 짰었는데,
 이 문제는 now == s 값이 성립하더라도, 그 다음값을 더해가면서 계속해서 값을 찾아야 하는 문제였음.
 */
