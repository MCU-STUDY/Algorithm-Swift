//
//  맥주 마시면서 걸어가기.swift
//  algo-swift-MCU
//  https://www.acmicpc.net/problem/9205
//  Created by 김민재 on 12/7/23.
//

import Foundation

let t = Int(readLine()!)!

for _ in 0..<t {
    let storeCount = Int(readLine()!)!
    let startInput = readLine()!.split(separator: " ").map { Int($0)! }
    
    let start = (startInput[1], startInput[0]) // 상근 집 시작
    var stores: [(Int, Int)] = [] // 편의점 위치
    for _ in 0..<storeCount {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        let x = input[0]
        let y = input[1]
        
        stores.append((y, x))
    }
    var destinationInput = readLine()!.split(separator: " ").map { Int($0)! }
    var destination = (destinationInput[1], destinationInput[0]) // 목적지
    
    var allSpaces: [(Int, Int)] = [start]
    allSpaces.append(contentsOf: stores)
    allSpaces.append(destination)
    
    func bfs(_ y: Int, _ x: Int) -> String {
        var visited = Array(repeating: false, count: allSpaces.count)
        var q = [(y, x)]
        var qIdx = 0
        
        while qIdx < q.count {
            let pop = q[qIdx]
            let y = pop.0
            let x = pop.1
            qIdx += 1
            
            if y == destination.0 && x == destination.1 {
                return "happy"
            }
            
            for (idx, space) in allSpaces.enumerated() {
                if calculateDistance((y, x), space) <= 1000 && !visited[idx] {
                    visited[idx] = true
                    q.append((space.0, space.1))
                }
            }
        }
        return "sad"
    }
    print(bfs(start.0, start.1))
}

func calculateDistance(_ from: (Int, Int), _ to: (Int, Int)) -> Int {
    let y1 = from.0
    let x1 = from.1
    
    let y2 = to.0
    let x2 = to.1
    return abs(y2 - y1) + abs(x2 - x1)
}
