import Foundation

let dy = [1, -1, 0, 0]
let dx = [0, 0, 1, -1]

func solution(_ maps:[String]) -> Int {
    
    let n = maps.count
    let m = maps[0].count
    
    var maps = maps.map {
        return Array($0).map { String($0) }
    }
    
    var pathMap = Array(repeating: Array(repeating: 0, count: m), count: n)
    var visited = Array(repeating: Array(repeating: false, count: m), count: n)
    
    var leverY = 0
    var leverX = 0
    var exitY = 0
    var exitX = 0
    for (i, map) in maps.enumerated() {
        for (j, str) in map.enumerated() {
            let str = String(str)
            if str == "L" {
                leverY = i
                leverX = j
            }
            if str == "E" {
                exitY = i
                exitX = j
            }
        }
    }
    
    func bfs(_ y: Int, _ x: Int, _ target: (Int, Int)) {
        var q = [(y, x)]
        visited[y][x] = true
        var qIdx = 0
        
        while qIdx < q.count {
            let y = q[qIdx].0
            let x = q[qIdx].1
            qIdx += 1
            
            if y == target.0 && x == target.1 {
                break
            }
            
            for i in 0..<4 {
                let ny = y + dy[i]
                let nx = x + dx[i]
                
                if 0..<n ~= ny && 0..<m ~= nx && !visited[ny][nx] && !(maps[ny][nx] == "X") {
                    visited[ny][nx] = true
                    q.append((ny, nx))
                    pathMap[ny][nx] = pathMap[y][x] + 1
                }
            }
        }
        
    }
    
    for i in 0..<n {
        for j in 0..<m {
            if !visited[i][j] && maps[i][j] == "S" {
                bfs(i, j, (leverY, leverX))
            }
        }
    }
    
    let leverPath = pathMap[leverY][leverX]
    
    
    var isCan = true
    
    if leverPath == 0 {
        isCan = false
    }
    
    pathMap = Array(repeating: Array(repeating: 0, count: m), count: n)
    visited = Array(repeating: Array(repeating: false, count: m), count: n)
    
    for i in 0..<n {
        for j in 0..<m {
            if !visited[i][j] && maps[i][j] == "L" {
                bfs(i, j, (exitY, exitX))
            }
        }
    }
    
    let exitPath = pathMap[exitY][exitX]
    
    if exitPath == 0 {
        isCan = false
    }
    
    
    return isCan ? leverPath + exitPath : -1
}
