//
//  백준 14940 쉬운 최단거리.swift
//  4week
//
//  Created by uiskim on 2023/08/30.
//

import Foundation

let commands = readLine()!.split(separator: " ").map{Int(String($0))!}
let height = commands[0]
let width = commands[1]

var miro: [[Int]] = Array(repeating: [], count: height)
let dirs = [[1,0], [-1,0], [0,1], [0, -1]]

for i in 0..<height {
    let command = readLine()!.split(separator: " ").map{Int(String($0))!}
    miro[i] = command
}


var isVisited = Array(repeating: Array(repeating: false, count: width), count: height)
var results = Array(repeating: Array(repeating: -1, count: width), count: height)

for y in 0..<height {
    for x in 0..<width {
        if miro[y][x] == 0 {
            results[y][x] = 0
        }
        
        if miro[y][x] == 2 {
            var queue = [(y, x, 0)]
            var index = 0
            results[y][x] = 0
            while queue.count > index {
                for dir in dirs {
                    let afterY = queue[index].0 + dir[0]
                    let afterX = queue[index].1 + dir[1]
                    let depth = queue[index].2
                    
                    if (0..<height).contains(afterY) && (0..<width).contains(afterX) && miro[afterY][afterX] == 1 && isVisited[afterY][afterX] == false {
                        isVisited[afterY][afterX] = true
                        results[afterY][afterX] = depth + 1
                        queue.append((afterY, afterX, depth + 1))
                    }
                    
                }
                index += 1
            }
        }
    }
}

results.forEach { list in
    list.forEach { element in
        print(element, terminator: " ")
    }
    print()
}
