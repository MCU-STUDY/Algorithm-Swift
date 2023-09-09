//
//  프로그래머스 모음사전(LV.2).swift
//  5week
//
//  Created by uiskim on 2023/09/03.
//

import Foundation
/// dictionary로 푸는게 더 느림 거의 두배...?
/// dictionary의 장점은 key를 가지고 value를 찾는 시간복잡도가 O(1)
/// array의 firstIndex(of:)는 O(n)
/// 그래서 dictionary를 만들어서 value를 찾아서 return하는 방식을 채택헀는데 최대2.4ms정도 걸림
/// array를 만들어서 firstIndex(of:)로 찾으니 최대1.4ms정도걸림

let alphabets = ["A", "E", "I", "O", "U"]
// var dictionary: [String: Int] = [:]
// var count = 0

var result: [String] = []

func dfs(str: String) {
    result.append(str)
    // dictionary[str] = count
    if str.count == 5 {
        return
    }
    for i in alphabets {
        // count += 1
        dfs(str: str + i)
    }
}

func solution(_ word:String) -> Int {
    dfs(str: "")
    return result.firstIndex(of: word)!
}


