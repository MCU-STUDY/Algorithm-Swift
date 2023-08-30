//
//  boj_14888.swift
//  algorithm
//
//  Created by 황찬미 on 2023/08/24.
//
//  연산자 끼워넣기
//  https://www.acmicpc.net/problem/14888

let input = Int(readLine()!)!
let number = readLine()!.split(separator: " ").map{Int($0)!}
let opNumber = readLine()!.split(separator: " ").map{Int($0)!}
var (sum, sub, mul, div) = (opNumber[0], opNumber[1], opNumber[2], opNumber[3])

var minNumber = Int.max
var maxNubmer = Int.min

func calculate(now: Int, depth: Int) {
    if depth == input {
        minNumber = min(minNumber, now)
        maxNubmer = max(maxNubmer, now)
    } else {
        if sum > 0 {
            sum -= 1
            calculate(now: now+number[depth], depth: depth+1)
            sum += 1
        }
        
        if sub > 0 {
            sub -= 1
            calculate(now: now-number[depth], depth: depth+1)
            sub += 1
        }
        
        if mul > 0 {
            mul -= 1
            calculate(now: now*number[depth], depth: depth+1)
            mul += 1
        }
        
        if div > 0{
            div -= 1
            calculate(now: now/number[depth], depth: depth+1)
            div += 1
        }
    }
}

calculate(now: number[0], depth: 1)

print(maxNubmer)
print(minNumber)

// 메모리 : 69108 KB, 시간 : 12 ms


