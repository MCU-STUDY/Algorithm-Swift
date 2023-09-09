//
//  프로그래머스 소수 찾기.swift
//  6week
//
//  Created by uiskim on 2023/09/09.
//

import Foundation

/// 중복이 되면 안된다 = visited배열이 필요함
/// 그래프모양이 아니기때문에 강제로 그래프모양으로 만들어줘야한다 for문활용
/// 같은 숫자지만 다른 노드일 가능성이 존재한다 false로의 초기화가 필요하다

func solution(_ numbers:String) -> Int {
    let piecesOfNumbers = numbers.map{Int(String($0))!}
    var isVisted: [Bool] = Array(repeating: false, count: piecesOfNumbers.count)
    var results: Set<Int> = []
    func dfs(_ start: [Int]) {
        if !start.isEmpty {
            results.insert(Int(start.map{String($0)}.joined())!)
        }
        for index in 0..<piecesOfNumbers.count {
            if !isVisted[index] {
                isVisted[index] = true
                dfs(start + [piecesOfNumbers[index]])
                isVisted[index] = false
            }
        }
    }
    dfs([])
    return results.filter{isSoSu($0)}.count
}

func isSoSu(_ input: Int) -> Bool {
    
    if input == 1 || input == 0 {
        return false
    }
    
    for i in 2..<input {
        if input % i == 0 {
            return false
        }
    }
    return true
}

