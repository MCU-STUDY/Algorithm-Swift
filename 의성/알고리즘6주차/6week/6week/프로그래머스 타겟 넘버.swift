//
//  프로그래머스 타겟 넘버.swift
//  6week
//
//  Created by uiskim on 2023/09/09.
//

import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {
    let ops = ["+", "-"]
    var results: [Int] = []
    
    func dfs(_ sum: Int, _ index: Int) {
        if index == numbers.count {
            results.append(sum)
            return
        }
        for i in 0..<ops.count {
            dfs(ops[i] == "+" ? sum+numbers[index] : sum-numbers[index], index+1)
        }
    }
    
    dfs(0,0)
    
    return results.filter{$0==target}.count
}

/// 중복이 되어도 상관 없음 isVisited필요없음
/// 그래프형태가 아니기 때문에 강제로 그래프 형태를 만들어줘야함
/// 숫자가 n개면 연산자도 n개가 들어가야함
