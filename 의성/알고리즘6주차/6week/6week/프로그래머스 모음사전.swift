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
