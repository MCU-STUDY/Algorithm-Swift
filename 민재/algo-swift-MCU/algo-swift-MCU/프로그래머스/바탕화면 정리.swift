//
//  바탕화면 정리.swift
//  algo-swift-MCU
//
//  Created by 김민재 on 10/25/23.
//

import Foundation

func solution(_ wallpaper:[String]) -> [Int] {
    var minX = Int.max
    var minY = Int.max
    
    var maxX = 0
    var maxY = 0
    for (idx, wall) in wallpaper.enumerated() {
        var wall = Array(wall)
        for (wIdx, w) in wall.enumerated() {
            if w == "#" {
                minX = min(minX, wIdx)
                minY = min(minY, idx)
                
                maxX = max(maxX, wIdx)
                maxY = max(maxY, idx)
            }
        }
    }
    
    return [minY, minX, maxY + 1, maxX + 1]
}
