//
//  모음사전.swift
//  algo-swift-MCU
//
//  Created by 김민재 on 10/3/23.
//

import Foundation

func solution(_ word: String) -> Int {
    var word = word

    let alphabet = ["A", "E", "I", "O", "U"]

    var answer = 0
    var cnt = 0
    func dfs(_ str: String, _ target: String) {

        if str.count > 5 {
            return
        }

        if str == target {
            answer = cnt
            return
        }

        cnt += 1

        for i in 0..<alphabet.count {
            dfs(str + alphabet[i], target)
        }
    }

    dfs("", word)

    return answer
}


/*
        A         E       I     O   U
    A E I O U  E I O U  I O U  O U  U

A E I O U


*/
