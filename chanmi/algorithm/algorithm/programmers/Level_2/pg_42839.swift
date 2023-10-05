//
//  pg_42839.swift
//  algorithm
//
//  Created by 황찬미 on 2023/09/08.
//
//  소수 찾기
//  https://school.programmers.co.kr/learn/courses/30/lessons/42839

import Foundation

func solution(_ numbers:String) -> Int {
    let numberArray = Array(numbers)
    var temp: Set<Int> = []
    var visited = Array(repeating: false, count: numbers.count)
    var result: Set<Int> = []
    
    func bruteForce(start: String, depth: Int) {
        var start = start
        if start.count == numberArray.count {
            return
        } else {
            for i in 0..<numberArray.count {
                if !visited[i] {
                    visited[i] = true
                    start += String(numberArray[i])
                    temp.insert(Int(start)!)
                    bruteForce(start: start, depth: depth+1)
                    start.removeLast()
                    visited[i] = false
                }
            }
        }
    }
    
    bruteForce(start: "", depth: 0)
    
    // 값이 0일 때도 있었음. 0일 때를 제외함.
    
    func isPrime(_ number: Int) -> Bool {
        if number < 4 {
           let result = (number == 1) || (number == 0) ? false : true
            return result
        }
        
        for i in 2...Int(sqrt(Double(number))) {
            if number % i == 0 {
                return false
            }
        }
        return true
    }
    
    for number in temp {
        if isPrime(number) {
            result.insert(number)
        }
    }
    
    result = temp.intersection(result)
    
    return result.count
}
