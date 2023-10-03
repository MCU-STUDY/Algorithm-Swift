//
//  단어변환.swift
//  algo-swift-MCU
//
//  Created by 김민재 on 10/3/23.
//

import Foundation

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {

    func isPossible(_ a: String, _ b: String) -> Bool {
        let a = Array(a)
        let b = Array(b)
        var count = 0
        for i in 0..<a.count {
            if a[i] != b[i] {
                count += 1
            }
        }
        return count == 1 ? true : false
    }

    var visited = Array(repeating: false, count: words.count)

    var ans = Int.max
    func dfs(_ start: String, _ depth: Int) {
        if start == target {
            ans = min(depth, ans)
            return
        }


        for (idx, word) in words.enumerated() {
            if !visited[idx] && isPossible(start, word) {
                visited[idx] = true
                dfs(word, depth + 1)
                visited[idx] = false
            }
        }
    }

    dfs(begin, 0)

    return ans == Int.max ? 0 : ans
}
