//
//  백준 감시.swift
//  7week
//
//  Created by uiskim on 2023/10/04.
//

import Foundation

let commands = readLine()!.split(separator: " ").map{Int(String($0))!}
var inputMap: [[Int]] = []
for _ in 0..<commands[0] {
    let line = readLine()!.split(separator: " ").map{Int(String($0))!}
    inputMap.append(line)
}
var walls: [[Int]] = []
var CCTVs: [(Int,Int,Int)] = []

for y in 0..<commands[0] {
    for x in 0..<commands[1] {
        if inputMap[y][x] == 6 { walls.append([y,x]) }
        if 1...5 ~= inputMap[y][x] { CCTVs.append((inputMap[y][x], y, x)) }
    }
}

enum Direction {
    case top, bottom, left, right
}

func checkOneDirection(_ start: [Int], _ dir: Direction) -> [[Int]] {
    var startY = start[0]
    var startX = start[1]
    var returnValue: [[Int]] = []
    switch dir {
    case .top:
        for _ in 0..<startY {
            startY -= 1
            let checkArea = [startY, startX]
            if walls.contains(checkArea) {
                break
            }
            returnValue.append([startY, startX])
        }
    case .bottom:
        for _ in 0..<(commands[0]-startY-1) {
            startY += 1
            let checkArea = [startY, startX]
            if walls.contains(checkArea) {
                break
            }
            returnValue.append([startY, startX])
        }
    case .left:
        for _ in 0..<startX {
            startX -= 1
            let checkArea = [startY, startX]
            if walls.contains(checkArea) {
                break
            }
            returnValue.append([startY, startX])
        }
    case .right:
        for _ in 0..<(commands[1]-startX-1) {
            startX += 1
            let checkArea = [startY, startX]
            if walls.contains(checkArea) {
                break
            }
            returnValue.append([startY, startX])
        }
    }
    return returnValue
}

func allAreaCheck(from: [(Int,Int,Int)]) -> [[[[Int]]]] {
    var returnValue: [[[[Int]]]] = []
    for index in 0..<from.count {
        let top = checkOneDirection([from[index].1,from[index].2], .top)
        let bottom = checkOneDirection([from[index].1,from[index].2], .bottom)
        let left = checkOneDirection([from[index].1,from[index].2], .left)
        let right = checkOneDirection([from[index].1,from[index].2], .right)
        switch from[index].0 {
        case 1:
            var checkList: [[[Int]]] = []
            checkList.append(top)
            checkList.append(bottom)
            checkList.append(left)
            checkList.append(right)
            returnValue.append(checkList)
        case 2:
            var checkList: [[[Int]]] = []
            checkList.append(left+right)
            checkList.append(top+bottom)
            returnValue.append(checkList)
        case 3:
            var checkList: [[[Int]]] = []
            checkList.append(top+right)
            checkList.append(right+bottom)
            checkList.append(bottom+left)
            checkList.append(left+top)
            returnValue.append(checkList)
        case 4:
            var checkList: [[[Int]]] = []
            checkList.append(top+right+left)
            checkList.append(right+bottom+top)
            checkList.append(bottom+left+right)
            checkList.append(left+top+bottom)
            returnValue.append(checkList)
        case 5:
            var checkList: [[[Int]]] = []
            checkList.append(top+bottom+left+right)
            returnValue.append(checkList)
        default:
            break
        }
    }
    
    return returnValue
}

var isVisited = Array(repeating: false, count: CCTVs.count)
var results: [Int] = []
var allResults: [[[Int]]] = []


func dfs(_ start: Int) {
    if start == CCTVs.count {
        var copyMap = inputMap
        let isChecked = allResults.flatMap{$0}
        for element in isChecked {
            let y = element[0]
            let x = element[1]
            copyMap[y][x] = 1
        }
        results.append(copyMap.flatMap{$0}.filter{$0==0}.count)
        return
    }
    for element in allAreaCheck(from: CCTVs)[start] {
        if !isVisited[start] {
            isVisited[start] = true
            allResults.append(element)
            dfs(start + 1)
            isVisited[start] = false
            allResults.removeLast()
        }
    }
    
}

dfs(0)

print(results.min()!)
