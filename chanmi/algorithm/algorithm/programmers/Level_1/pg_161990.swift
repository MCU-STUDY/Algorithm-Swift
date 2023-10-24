//
//  pg_161990.swift
//  algorithm
//
//  Created by 황찬미 on 2023/10/24.
//
//  바탕화면 정리
//  https://school.programmers.co.kr/learn/courses/30/lessons/161990

import Foundation

func solution(_ wallpaper:[String]) -> [Int] {
    
    var wallpaperArray = Array(repeating: [String](), count: wallpaper.count)
    
    for i in 0..<wallpaper.count {
        let array = Array(wallpaper[i]).map{String($0)}
        wallpaperArray[i] = array
    }
    
    var resultX = [Int]()
    var resultY = [Int]()
    
    for i in 0..<wallpaperArray.count {
        for j in 0..<wallpaperArray[i].count {
            if wallpaperArray[i][j] == "#" {
                resultX.append(i)
                resultY.append(j)
            }
        }
    }
    
    resultY.sort()
    
    let startX = resultX.first!
    let startY = resultY.first!
    
    let endX = resultX.last!+1
    let endY = resultY.last!+1
    
    return [startX, startY, endX, endY]
}

print(solution(["..........", ".....#....", "......##..", "...##.....", "....#....."]))
