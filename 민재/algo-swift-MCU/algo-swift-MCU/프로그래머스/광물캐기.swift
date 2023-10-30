import Foundation

func solution(_ picks:[Int], _ minerals:[String]) -> Int {
    var picks = picks
    var answer: Int = 0
    
    let sumPick = picks.reduce(0, +)
    if sumPick == 0 {
        return 0
    }
    
    var totalCount = 0
    
    if sumPick * 5 > minerals.count {
        totalCount = minerals.count
    } else {
        totalCount = sumPick * 5
    }
    
    var mineralCounts = Array(repeating: [0, 0, 0], count: 10)
    
    for i in 0..<totalCount {
        if minerals[i] == "diamond" {
            mineralCounts[i / 5][0] += 1
        }
        if minerals[i] == "iron" {
            mineralCounts[i / 5][1] += 1
        }
        if minerals[i] == "stone" {
            mineralCounts[i / 5][2] += 1
        }
    }
    
    mineralCounts.sort {
        if $0[0] == $1[0] {
            if $0[1] == $1[1] {
                return $0[2] > $1[2]
            }
            return $0[1] > $1[1]
        }
        return $0[0] > $1[0]
    }
    
    
    for i in 0..<mineralCounts.count {
        
        let diamond = mineralCounts[i][0] // diamond
        let iron = mineralCounts[i][1] // iron
        let stone = mineralCounts[i][2]

        if picks[0] > 0 {
            picks[0] -= 1
            answer += diamond + iron + stone
        } else if picks[1] > 0 {
            picks[1] -= 1
            answer += diamond * 5 + iron + stone
        } else if picks[2] > 0 {
            picks[2] -= 1
            answer += diamond * 25 + iron * 5 + stone
        }
    }
    
    
    return answer
}

let a = solution([1, 1, 1], ["stone", "stone", "stone", "stone", "stone", "diamond", "diamond", "diamond", "diamond", "diamond", "stone", "stone", "stone", "stone", "stone"])

print(a)
