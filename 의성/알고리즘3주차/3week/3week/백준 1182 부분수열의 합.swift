//
//  백준 1182 부분수열의 합.swift
//  3week
//
//  Created by uiskim on 2023/09/01.
//

import Foundation

let ns = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = ns[0]
let s = ns[1]

let arr = readLine()!.split(separator: " ").map{Int(String($0))!}
var visited = Array(repeating: false, count: 21)

var cnt = 0
var sum = 0
func dfs(_ input: [Int], start: Int){
    if input.count > 0, input.reduce(0, +) == s {
        cnt += 1
    }

    /// N과M은 무조건 1부터 n까지 for문을 돌았기 때문에
    /// [1,2,3,4]라면 늘 1,2,3,4로 돎
    /// 시작점과 상관없이 1,2,3,4순으로 돌지만
    /// 이 문제의 경우엔 -7, -3, -2, 5, 8에서 -3에서 출발할때는 -7을 배제해야하고 -2에서 출발할때는 -7과 -3을 배제해야함
    /// 처음에는 []로 시작했다가
    /// i에 0이들어가서 -7이 들어감, 여전히 i는 0
    /// [-7]에 start는 0
    /// [-7, -3]에 start는 1
    /// [-7, -3, -2]에 start는 2
    /// [-7, -3, -2, 5]에 start는 3
    /// [-7, -3, -2, 5, 8]에 start는 4
    /// ... -7이 시작점인 모든 경우의 수를 누적해서 출력함
    ///
    /// start가 0일때 재귀가 끝나서 start가 1이 됨
    /// 그러면 [-3]이 들어가고 start는 1이됨
    /// [-3, -2]에 start는 2
    /// [-3, -2, 5]에 start는 3
    /// [-3, -2, 5, 8]에 start는 4
    /// ... -3이 시작점인 모든 경우의 수를 누적해서 출력함
    ///
    /// start가 1일때 재귀가 끝나서 start가 2가됨
    /// [-2]가 들어가고 start는 2가 됨
    for i in start..<arr.count {
        if !visited[i]{
            visited[i] = true
            dfs(input + [arr[i]], start: i)
            visited[i] = false
        }
    }
}

dfs([], start: 0)
print(cnt)
