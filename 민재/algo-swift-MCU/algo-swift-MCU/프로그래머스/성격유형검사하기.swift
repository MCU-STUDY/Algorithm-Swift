//
//  성격유형검사하기.swift
//  algo-swift-MCU
//
//  Created by 김민재 on 11/15/23.
//

import Foundation

func solution(_ survey:[String], _ choices:[Int]) -> String {
    var score = [3,2,1,0,1,2,3]
    
    var dict: [Character: Int] = [:]
    
    for (i, choice) in choices.enumerated() {
        let idx = choice - 1
        let sc = score[idx]
        
        let arr = Array(survey[i])
        let notAgree = arr[0]
        let agree = arr[1]
        
        if (0...2).contains(idx) {
            dict[notAgree, default: 0] += sc
        } else if (4...6).contains(idx) {
            dict[agree, default: 0] += sc
        }
    }
    
    var result = ""
    if dict["R"] ?? 0 >= dict["T"] ?? 0 {
        result += "R"
    } else {
        result += "T"
    }
    if dict["C"] ?? 0 >= dict["F"] ?? 0 {
        result += "C"
    } else {
        result += "F"
    }
    if dict["J"] ?? 0 >= dict["M"] ?? 0 {
        result += "J"
    } else {
        result += "M"
    }
    
    if dict["A"] ?? 0 >= dict["N"] ?? 0 {
        result += "A"
    } else {
        result += "N"
    }
    
    
    return result
}

// 15분 걸림
func solution2(_ survey:[String], _ choices:[Int]) -> String {
    /*
    이언형(R), 튜브형(T)
2번 지표    콘형(C), 프로도형(F)
3번 지표    제이지형(J), 무지형(M)
4번 지표    어피치형(A), 네오형(N)
    
    // 전체 성격에 대한 딕셔너리 지표를 가지고 있는다.
    // survey를 For문으로 순회하며 점수를 기록한다.
    그리고 이후에 R, T
    C, F
    J, M
    A, N
    높은 것들, 같다면 사전순대로 string에 붙여서
    마지막에 출력한다.
    
    
    3 2 1 0 1 2 3
    */
    var dict: [String: Int] = [:]
    ["T", "R", "C", "F", "J", "M", "A", "N"].forEach {
        dict[$0] = 0
    }
    
    for i in 0..<survey.count {
        let arr = Array(survey[i])
        let choice = choices[i]
        let notAgree = String(arr[0])
        let agree = String(arr[1])
        
        var score = 0
        if choice > 4 {
            score = choice - 4
            dict[agree]! += score
        } else if choice < 4 {
            score = 4 - choice
            dict[notAgree]! += score
        }
    }
    
    var answer = ""
    [["T", "R"], ["C", "F"], ["J", "M"], ["A", "N"]].forEach { person in
        if dict[person[0]]! == dict[person[1]]! {
            let sorted = person.sorted()
            answer += sorted[0]
        } else if dict[person[0]]! > dict[person[1]]! {
            answer += person[0]
        } else {
            answer += person[1]
        }
    }
    
    return answer
}
