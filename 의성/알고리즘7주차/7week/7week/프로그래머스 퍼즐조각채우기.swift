//
//  프로그래머스 퍼즐조각채우기.swift
//  7week
//
//  Created by uiskim on 2023/09/19.
//

import Foundation

let game_board = [[1,1,0,0,1,0],[0,0,1,0,1,0],[0,1,1,0,0,1],[1,1,0,1,1,1],[1,0,0,0,1,0],[0,1,1,1,0,0]]
let table = [[1,0,0,1,1,0],[1,0,1,0,1,0],[0,1,1,0,1,1],[0,0,1,0,0,0],[1,1,0,1,1,0],[0,1,0,0,0,0]]
let widthAndHeight = table.count

var tableIsVisited = Array(repeating: Array(repeating: false, count: widthAndHeight), count: widthAndHeight)
var gameBoardIsVisited = Array(repeating: Array(repeating: false, count: widthAndHeight), count: widthAndHeight)
let direction = [[-1,0], [0,-1], [1,0], [0,1]]

func solution(_ game_board:[[Int]], _ table:[[Int]]) -> Int {
    return -1
}

var puzzle: [(Int,Int)] = []
var puzzles: [[(Int,Int)]] = []
var allPuzzles: [[(Int, Int)]] = []
var rotatePuzzleSet: [[[(Int, Int)]]] = []

func tableDfs(y: Int, x: Int) {
    /// 문제의 제약조건
    if y < 0 || y >= widthAndHeight || x < 0 || x >= widthAndHeight || table[y][x] == 0 {
        return
    }
    
    /// 재귀의 탈출 조건
    if !tableIsVisited[y][x] {
        puzzle.append((y, x))
        tableIsVisited[y][x] = true
        tableDfs(y: y-1, x: x)
        tableDfs(y: y, x: x-1)
        tableDfs(y: y+1, x: x)
        tableDfs(y: y, x: x+1)
    }
}

for y in 0..<widthAndHeight {
    for x in 0..<widthAndHeight {
        if table[y][x] == 1 && tableIsVisited[y][x] == false {
            tableDfs(y: y, x: x)
            puzzles.append(puzzle)
            puzzle.removeAll()
        }
    }
}

func rotate90(_ input: [(Int, Int)]) -> [(Int, Int)] {
    var output: [(Int, Int)] = []
    for xy in input {
        var returnValue: (Int, Int) = (0,0)
        returnValue.0 = xy.1
        returnValue.1 = widthAndHeight - xy.0 - 1
        output.append(returnValue)
    }
    
    let minY = output.map{$0.0}.min()!
    let minX = output.map{$0.1}.min()!
    
    return output.map { ($0 - minY, $1 - minX) }.sorted(by: <)
}

for puzzle in puzzles {
    let puzzle90 = rotate90(puzzle)
    let puzzle180 = rotate90(puzzle90)
    let puzzle270 = rotate90(puzzle180)
    let puzzle360 = rotate90(puzzle270)
    rotatePuzzleSet.append([puzzle360, puzzle90, puzzle180, puzzle270])
}

print("✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅asdfasfasfsafasfasfsf✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅")
for i in rotatePuzzleSet {
    print(i)
}
print("✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅")


var board: [(Int, Int)] = []
var boards: [[(Int, Int)]] = []

func gameDfs(y: Int, x: Int) {
    if y < 0 || y >= widthAndHeight || x < 0 || x >= widthAndHeight || game_board[y][x] == 1 {
        return
    }
    
    /// 재귀의 탈출 조건
    if !gameBoardIsVisited[y][x] {
        board.append((y, x))
        gameBoardIsVisited[y][x] = true
        gameDfs(y: y-1, x: x)
        gameDfs(y: y, x: x-1)
        gameDfs(y: y+1, x: x)
        gameDfs(y: y, x: x+1)
    }
}


for y in 0..<widthAndHeight {
    for x in 0..<widthAndHeight {
        if game_board[y][x] == 0 && gameBoardIsVisited[y][x] == false {
            gameDfs(y: y, x: x)
            boards.append(board)
            board.removeAll()
        }
    }
}
print("✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅")
print(boards)
print("✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅")
let sortedEmptySpaces = boards.map { emptySpace in
    let minY = emptySpace.map{$0.0}.min()!
    let minX = emptySpace.map{$0.1}.min()!
    return emptySpace.map { ($0 - minY, $1 - minX) }.sorted(by: <)
}

print("✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅")
print("비어있는공간")
for i in sortedEmptySpaces {
    print(i)
}
print("✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅")


var isEmptyFill = Array(repeating: false, count: sortedEmptySpaces.count) {
    didSet {
        print(isEmptyFill)
    }
}
var puzzleUsed = Array(repeating: false, count: rotatePuzzleSet.count)
var results = 0


for (spaceIndex ,emptySpace) in sortedEmptySpaces.enumerated() {
    print("✅✅✅✅✅✅✅✅✅✅✅✅✅✅fasfsf✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅")
    print(spaceIndex)
    print(emptySpace)
    print("✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅")
    if isEmptyFill[spaceIndex] {
        continue
    }
    for (puzzleIndex, puzzles) in rotatePuzzleSet.enumerated() {
        if puzzleUsed[puzzleIndex] {
            continue
        }
        
        if puzzles.map({String(describing: $0)}).contains(String(describing: emptySpace)) {
            print("일치하는 공간")
            print(emptySpace)
            isEmptyFill[spaceIndex] = true
            puzzleUsed[puzzleIndex] = true
            print("🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥")
            print(puzzles[0].count)
            print("🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥")
            results += puzzles[0].count
            break
        }
    }
}

print(results)


