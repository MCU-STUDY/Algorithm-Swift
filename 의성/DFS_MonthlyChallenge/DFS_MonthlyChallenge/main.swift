//
//  main.swift
//  DFS_MonthlyChallenge
//
//  Created by uiskim on 2023/11/20.
//

import Foundation

let commands = readLine()!.split(separator: " ").map{Int(String($0))!}
let width = commands[0]
let height = commands[1]

var map: [[Int]] = []

for _ in 0..<height {
    let array = readLine()!.split(separator: " ").map{Int(String($0))!}
    map.append(array)
}

var startCoordinator: [(y: Int, x: Int)] = []

for y in 0..<height {
    for x in 0..<width {
        if map[y][x] == 1 {
            startCoordinator.append((y: y, x: x))
        }
    }
}
/// 방향 상 하 좌 우 순서
var direction = [(-1,0),(1,0),(0,-1),(0,1)]

func bfs() -> Int {
    var queue: [(Int,Int,Int)] = []
    startCoordinator.forEach { queue.append(($0.y, $0.x, 0)) }
    var index = 0
    var days = 0
    
    while queue.count > index {
        let y = queue[index].0
        let x = queue[index].1
        let depth = queue[index].2
        days = depth
        
        for afterCoordinator in direction {
            let afterY = y+afterCoordinator.0
            let afterX = x+afterCoordinator.1
            
            if (0..<height) ~= afterY && (0..<width) ~= afterX && map[afterY][afterX] == 0 && map[afterY][afterX] != -1 {
                map[afterY][afterX] = 1
                queue.append((afterY,afterX, depth+1))
            }
        }
        index += 1
    }
    
    for y in 0..<height {
        for x in 0..<width {
            if map[y][x] == 0 {
                return -1
            }
        }
    }
    return days
}

print(bfs())
