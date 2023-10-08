//
//  백준 파스칼의 삼각형.swift
//  DP
//
//  Created by uiskim on 2023/10/08.
//

import Foundation

let commands = readLine()!.split(separator: " ").map{Int(String($0))!}
let square = commands[0]
let index = commands[1]

var resultArray = Array(repeating: Array(repeating: 0, count: square+1), count: square+1)

resultArray[0][0] = 1

for i in 1..<resultArray.count {
    for j in 1..<resultArray.count {
        resultArray[i][j] = resultArray[i-1][j] + resultArray[i-1][j-1]
    }
}
print(resultArray[square][index])
