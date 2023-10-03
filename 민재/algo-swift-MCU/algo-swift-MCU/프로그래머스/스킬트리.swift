//
//  스킬트리.swift
//  algo-swift-MCU
//
//  Created by 김민재 on 10/3/23.
//

import Foundation

func solution(_ skill:String, _ skill_trees:[String]) -> Int {

    var skill = Array(skill)
    var failCount = 0
    for stree in skill_trees {

        var filtered = Array(stree.filter { skill.contains($0) }.map { String($0) }
        .reversed())


        var idx = 0
        while !filtered.isEmpty {

            if filtered.removeLast() != String(skill[idx]) {
                failCount += 1
                break
            }
            idx += 1
        }
    }
    return skill_trees.count - failCount
}


/*
스킬을 가진 애들만 남기고 나머지 다 지운다.
그리고 해당 순서 그대로 맨 앞에서부터 빼고, 그 뺀 것을 skill의 앞에서부터 비교한다.
예를 들면 [C, B, A, D, F]를 지우면 [C, B, D]가 남고
C를 뺀 것을 skill의 0번째와 비교 똑같으면 Pass -> [B, D]
이제 B를 빼고 두번째 스킬과 비교, ...


skill CBD
[C, D]이면
C를 뺀 것이 처음과 같으니 pass -> [D]
D를 뺐는데 두번째 B와 다르니 fail.

*/
