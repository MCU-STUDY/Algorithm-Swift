//
//  프로그래머스 모음사전.swift
//  6week
//
//  Created by uiskim on 2023/09/09.
//

import Foundation

let alphabets = ["A", "E", "I", "O", "U"]
var count = 0
var results: [String] = []


/// graph모양이 아니기 때문에 for문으로 인접노드들을 정해줘야함
/// 인접노드를 정해줄때 중복이 있으면 안되는거면 isVisited가 필요한데 얘는 중복이 가능하잖아...? 그럼 visited도 필요없어
/// isVisited가 있으면 그걸로 탈출조건이 되는데 여기서 탈출조건은 뭐지 => 길이가 5이하인 단어

func solution(_ word:String) -> Int {
    dfs([])
    
    return results.firstIndex(of: word)!
}

func dfs(_ input: [String]) {
    if input.count > 5 {
        return
    }
    
    results.append(input.joined())
    
    for i in alphabets {
        dfs(input + [i])
    }
}


/// 중간에 조건을 만족하면 재귀함수 stack을 전부 return할수있도록 계속 return해서 계속 탐색하지 않게
/// 중간에 count를 저장하더라도 결국은 전부다 돌아야해서 비효율적이다
import Foundation

let alphabets = ["A", "E", "I", "O", "U"]
var results: [String] = []
var count = 0

func solution(_ word:String) -> Int {
    func dfs(_ input: [String]) -> Int {
        if input.joined() == word {
            return count
        }

        if input.count >= 5 {
            return 0
        }
        
        for i in alphabets {
            count += 1
            let value = dfs(input + [i])
            if value != 0 {
                return value
            }
        }
        return 0
    }
    
    return dfs([])
}

//테스트 1 〉    통과 (0.05ms, 16.5MB)
//테스트 2 〉    통과 (0.24ms, 16.6MB)
//테스트 3 〉    통과 (2.29ms, 16.5MB)
//테스트 4 〉    통과 (5.89ms, 16.2MB)
//테스트 5 〉    통과 (2.26ms, 16.3MB)
//테스트 6 〉    통과 (0.63ms, 16.3MB)
//테스트 7 〉    통과 (2.67ms, 16.4MB)
//테스트 8 〉    통과 (0.91ms, 16.4MB)
//테스트 9 〉    통과 (2.10ms, 16.3MB)
//테스트 10 〉    통과 (0.68ms, 16.4MB)
//테스트 11 〉    통과 (2.75ms, 16.4MB)
//테스트 12 〉    통과 (0.42ms, 16.5MB)
//테스트 13 〉    통과 (1.72ms, 16.5MB)
//테스트 14 〉    통과 (1.65ms, 16.1MB)
//테스트 15 〉    통과 (4.45ms, 16.2MB)
//테스트 16 〉    통과 (1.11ms, 16.5MB)
//테스트 17 〉    통과 (2.23ms, 16.5MB)
//테스트 18 〉    통과 (0.93ms, 16.4MB)
//테스트 19 〉    통과 (3.16ms, 16.3MB)
//테스트 20 〉    통과 (0.58ms, 16.5MB)
//테스트 21 〉    통과 (0.07ms, 16.3MB)
//테스트 22 〉    통과 (0.91ms, 16.5MB)
//테스트 23 〉    통과 (0.21ms, 16.3MB)
//테스트 24 〉    통과 (0.70ms, 16.3MB)
//테스트 25 〉    통과 (0.30ms, 16.5MB)
//테스트 26 〉    통과 (0.71ms, 16.3MB)
//테스트 27 〉    통과 (1.55ms, 16.4MB)
//테스트 28 〉    통과 (2.84ms, 16.3MB)
//테스트 29 〉    통과 (0.09ms, 16.3MB)
//테스트 30 〉    통과 (0.34ms, 16.4MB)
//테스트 31 〉    통과 (1.16ms, 16.3MB)
//테스트 32 〉    통과 (1.88ms, 16.5MB)
//테스트 33 〉    통과 (3.09ms, 16.3MB)
//테스트 34 〉    통과 (2.13ms, 16.5MB)
//테스트 35 〉    통과 (2.72ms, 16.3MB)
//테스트 36 〉    통과 (2.61ms, 16.6MB)
//테스트 37 〉    통과 (0.69ms, 16.3MB)
//테스트 38 〉    통과 (1.53ms, 16.5MB)
//테스트 39 〉    통과 (2.76ms, 16.6MB)
//테스트 40 〉    통과 (1.42ms, 16.3MB)
