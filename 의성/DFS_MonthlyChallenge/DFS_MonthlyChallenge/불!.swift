//
//  불!.swift
//  DFS_MonthlyChallenge
//
//  Created by uiskim on 2023/11/23.
//

import Foundation

let commands = readLine()!.split(separator: " ").map{Int(String($0))!}
let height = commands[0]
let width = commands[1]
var map: [[String]] = []
for _ in 0..<height {
    let mapArray = readLine()!.map{String($0)}
    map.append(mapArray)
}

func findJihoon(from map: [[String]]) -> [Int] {
    for y in 0..<height {
        for x in 0..<width {
            if map[y][x] == "J" {
                return [y,x]
            }
        }
    }
    return []
}

func findFire(from map: [[String]]) -> [[Int]] {
    var returnValue: [[Int]] = []
    for y in 0..<height {
        for x in 0..<width {
            if map[y][x] == "F" {
                returnValue.append([y,x])
            }
        }
    }
    return returnValue
}

var directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]
var jihoonPosition = findJihoon(from: map)
var firePositions = findFire(from: map)

var isVisited = Array(repeating: Array(repeating: false, count: width), count: height)

func bfs() -> Int {
    var queue: [(String, Int, Int, Int)] = [("J", jihoonPosition[0], jihoonPosition[1], 0)]
    firePositions.forEach { queue.append(("F", $0[0], $0[1], 0)) }
    var index = 0
    
    while queue.count > index {
        let type = queue[index].0
        let y = queue[index].1
        let x = queue[index].2
        let depth = queue[index].3
        
        isVisited[y][x] = true
        
        for dir in directions {
            let afterY = y+dir.0
            let afterX = x+dir.1
            if type == "J" {
                if map[y][x] == "F" {
                    break
                }
                if !((0..<height) ~= afterY) || !((0..<width) ~= afterX) {
                    return depth + 1
                }
                if (0..<height) ~= afterY && (0..<width) ~= afterX && !isVisited[afterY][afterX] && map[afterY][afterX] == "." {
                    map[afterY][afterX] = "J"
                    isVisited[afterY][afterX] = true
                    map[y][x] = "."
                    queue.append(("J", afterY, afterX, depth+1))
                }
            }
            
            if type == "F" {
                if (0..<height) ~= afterY && (0..<width) ~= afterX {
                    if map[afterY][afterX] != "#" && map[afterY][afterX] != "F" {
                        map[afterY][afterX] = "F"
                        queue.append(("F", afterY, afterX, 0))
                    }
                }
            }
        }
        index += 1
    }
    return -1
}

let result = bfs()
print(result == -1 ? "IMPOSSIBLE" : result)

