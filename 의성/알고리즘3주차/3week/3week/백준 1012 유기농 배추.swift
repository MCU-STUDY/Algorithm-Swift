//
//  백준 1012 유기농 배추.swift
//  3week
//
//  Created by uiskim on 2023/08/24.
//

import Foundation

let loopCount = Int(readLine()!)!

for _ in 0..<loopCount {
    let commmends = readLine()!.split(separator: " ").map{Int(String($0))!}
    let maxX = commmends[0]
    let maxY = commmends[1]
    let numberOfObject = commmends[2]
    /// 결국 이런문제는 2차원배열로 풀어서 각각의 요소를 false로 만든 후
    /// 실제로 배추가있는곳은 true로 해놓고 true인곳에서 DFS를 시작해서 DFS가 끝날때마다 result를 1개씩 높인다
    var farm = Array(repeating: Array(repeating: false, count: maxX), count: maxY)
    for _ in 0..<numberOfObject {
        let coordinator = readLine()!.split(separator: " ").map{Int(String($0))!}
        farm[coordinator[1]][coordinator[0]] = true
    }
    
    var result = 0
    
    for x in 0..<maxX {
        for y in 0..<maxY {
            if farm[y][x] {
                dfs(x: x, y: y)
                /// dfs가 끝났다 == 하나의 그래프를 모두 탐색했다
                /// 즉, 그래프 하나를 탬색했다
                /// 결국 이 문제는 farm에서 그래프가 총 몇개인지를 묻는 문제
                result += 1
            }
        }
    }
    
    print(result)
    
    
    func dfs(x: Int, y: Int) {
        /// 이때 x랑 y가 max보다 크거나 "같다"인 이유
        /// width는 10개여도 x좌표는 0부터9까지이기때문에
        /// 만약에 x좌표가 9인경우 오른쪽으로 가면 10이되고 이는 maxY(=maxWidht)와 같아지는 순간임
        /// 따라서 y좌표가 height와 같아지는 순간은 이미 farm을 나간 case임
        if x < 0 || x >= maxX || y < 0 || y >= maxY {
            return
        }
        
        if farm[y][x] {
            farm[y][x] = false
            dfs(x: x, y: y+1)
            dfs(x: x, y: y-1)
            dfs(x: x-1, y: y)
            dfs(x: x+1, y: y)
        }
    }
}
