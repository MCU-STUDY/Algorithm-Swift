//
//  벽부수고이동하기1.swift
//  DFS_MonthlyChallenge
//
//  Created by uiskim on 2023/11/27.
//

import Foundation

let commands = readLine()!.split(separator: " ").map{Int(String($0))!}
let height = commands[0]
let width = commands[1]
var map: [[Int]] = []
for _ in 0..<height {
    let widthArray = readLine()!.map{Int(String($0))!}
    map.append(widthArray)
}

var directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]
var count = 0
var isVisited = Array(repeating: Array(repeating: Array(repeating: false, count: width), count: height), count: 2)

func bfs() -> Int {
    var queue: [(y:Int, x:Int, crashed: Int, depth: Int)] = [(y: 0, x: 0, crashed: 0, depth: 1)]
    isVisited[0][0][0] = true
    var index = 0
    while queue.count > index {
        let y = queue[index].y
        let x = queue[index].x
        let crashed = queue[index].crashed
        let depth = queue[index].depth
        if y == height-1 && x == width-1 {
            return depth
        }
        for dir in directions {
            let afterY = y+dir.0
            let afterX = x+dir.1
            
            if (0..<height) ~= afterY && (0..<width) ~= afterX && !isVisited[crashed][afterY][afterX] {
                if map[afterY][afterX] == 1 {
                    if crashed == 0 {
                        isVisited[crashed+1][afterY][afterX] = true
                        queue.append((y: afterY, x: afterX, crashed: crashed+1, depth: depth+1))
                    }
                }
                if map[afterY][afterX] == 0 {
                    isVisited[crashed][afterY][afterX] = true
                    queue.append((y: afterY, x: afterX, crashed: crashed, depth: depth+1))
                }
            }
        }
        index += 1
        
    }
    return -1
}

print(bfs())
