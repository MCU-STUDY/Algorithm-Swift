//
//  main.swift
//  4week
//
//  Created by uiskim on 2023/08/27.
//

import Foundation

let commands = readLine()!.split(separator: " ").map{Int(String($0))!}
let height = commands[0]
let width = commands[1]
var miro: [[Int]] = Array(repeating: [], count: height)
var isVisited = Array(repeating: Array(repeating: false, count: width), count: height)
isVisited[0][0] = true
let dirs = [[0,1], [0,-1], [1,0], [-1,0]]

for i in 0..<height {
    let widthCordinator = readLine()!.split(separator: "").map{Int(String($0))!}
    miro[i] = widthCordinator
}

print(miro)

func dfs(startHight: Int, startWidht: Int) {
    var queue = [(startHight, startWidht, 0)]
    var index = 0
    var depth = 0
    
    if queue.count > index {
        for dir in dirs {
            let moveHeight = queue[index].0 + dir[0]
            let moveWidth = queue[index].1 + dir[1]
            if (0..<height).contains(moveHeight) && (0..<width).contains(moveWidth) && isVisited[moveHeight][moveWidth] == false {
                if miro[moveHeight][moveWidth] == 1 {
                    queue.append((moveHeight, moveWidth, depth+1))
                    isVisited[moveHeight][moveWidth] = true
                }
            }
        }
        index += 1
        depth += 1
    }
    
    print(queue)
    
}
dfs(startHight: 0, startWidht: 0)
