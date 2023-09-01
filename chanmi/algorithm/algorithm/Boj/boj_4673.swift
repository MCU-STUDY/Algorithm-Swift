//
//  boj_4673.swift
//  algorithm
//
//  Created by 황찬미 on 2023/08/24.
//
//  셀프 넘버
//  https://www.acmicpc.net/problem/4673

var tempArray: Set<Int> = []

for number in 1...10000 {
    var num = number
    let array = Array(String(num))
    // 셀프 넘버 값 삽입
    num += array.map{Int(String($0))!}.reduce(0, +)
    tempArray.insert(num)
}

// 셀프 넘어 걸러내기

var result: Set<Int> = []

for number in 1...10000 {
    result.insert(number)
}

let subResult = result.subtracting(tempArray)
let sortResult = subResult.sorted()

for number in sortResult {
    print(number)
}

// 메모리 : 69516 KB, 시간 : 16 ms
