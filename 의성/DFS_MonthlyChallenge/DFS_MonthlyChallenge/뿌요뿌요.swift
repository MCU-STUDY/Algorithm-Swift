//
//  뿌요뿌요.swift
//  DFS_MonthlyChallenge
//
//  Created by uiskim on 2023/11/21.
//

import Foundation

var result = 0

var field: [[String]] = []

for _ in 0..<12 {
    let input = readLine()!.map{String($0)}
    field.append(input)
}

func makeFieldDown() {
    for y in (0...10).reversed() {
        for x in (0...5).reversed() {
            if field[y][x] != "." {
                var downCount = 0
                while true {
                    if y+downCount+1 > 11 || field[y+downCount+1][x] != "." {
                        break
                    }
                    downCount += 1
                }
                if downCount > 0 {
                    field[y+downCount][x] = field[y][x]
                    field[y][x] = "."
                }
            }
        }
     }
}

var isVisted = Array(repeating: Array(repeating: false, count: 6), count: 12)

func findBomb(input: String, y: Int, x: Int) -> Bool {
    let direction = [(-1,0),(1,0),(0,-1),(0,1)]
    var willRemoved: [[Int]] = []
    func dfs(y: Int, x: Int) {
        isVisted[y][x] = true
        willRemoved.append([y,x])
        for dir in direction {
            let willY = y+dir.0
            let willX = x+dir.1
            if (0...11) ~= willY && (0...5) ~= willX && field[willY][willX] == input && !isVisted[willY][willX] {
                dfs(y: willY, x: willX)
            }
        }
    }
    dfs(y: y, x: x)
    
    if willRemoved.count >= 4 {
        for i in 0..<willRemoved.count {
            let coor = willRemoved[i]
            field[coor[0]][coor[1]] = "."
        }
        return true
    }
    return false
}

while true {
    var bombFlag = false
    for y in 0..<12 {
        for x in 0..<6 {
            if !isVisted[y][x] && field[y][x] != "." {
                if findBomb(input: field[y][x], y: y, x: x) {
                    bombFlag = true
                }
            }
        }
    }
    
    if !bombFlag {
        break
    }
    
    makeFieldDown()
    isVisted = Array(repeating: Array(repeating: false, count: 6), count: 12)
    bombFlag = false
    result += 1
}

print(result)

