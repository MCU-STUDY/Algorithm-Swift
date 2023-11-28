//
//  백준1058 친구 풀이.swift
//  Algorithm1027
//
//  Created by uiskim on 2023/10/27.
//

import Foundation

let loops = Int(readLine()!)!
var graph = Array(repeating: Array(repeating: "", count: loops), count: loops)
for index in 0..<loops {
    let commands = readLine()!.map{String($0)}
    graph[index] = commands
}

var friends = Array(repeating: Array(repeating: 0, count: loops), count: loops)

var count = 0
for k in 0..<loops {
    for i in 0..<loops {
        for j in 0..<loops {
            if i == j { continue }
            if graph[i][j] == "Y" || (graph[i][k] == "Y" && graph[k][j] == "Y") {
                friends[i][j] = 1
            }
        }
    }
}

print(friends.map{$0.reduce(0, +)}.max()!)
