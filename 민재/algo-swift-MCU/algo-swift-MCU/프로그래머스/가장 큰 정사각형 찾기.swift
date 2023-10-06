//
//  가장 큰 정사각형 찾기.swift
//  algo-swift-MCU
//  https://school.programmers.co.kr/learn/courses/30/lessons/12905
//  Created by 김민재 on 10/6/23.
//  풀이 아이디어 참고: https://soobarkbar.tistory.com/164

import Foundation

func solution(_ board:[[Int]]) -> Int
{
    var board = board
    let n = board.count
    let m = board[0].count

    var maxN = 1
    var flag = false
    for i in 0..<n {
        for j in 0..<m {
            if board[i][j] != 0 {
                if i-1 >= 0 && j-1 >= 0 {
                    let base = min(board[i-1][j], board[i][j-1], board[i-1][j-1])
                    board[i][j] = base + 1
                    maxN = max(maxN, board[i][j])
                }
                flag = true // [[1]] 1하나만 있을 때, 1x1도 정사각형임
            }
        }
    }

    if !flag && maxN == 1 { // 전부 0 일 때
        maxN = 0
    }

    return maxN * maxN
}
