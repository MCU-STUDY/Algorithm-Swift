//
//  혼자놀기의 달인.swift
//  algo-swift-MCU
//
//  Created by 김민재 on 10/6/23.
//

import Foundation

func solution(_ cards:[Int]) -> Int {

    var first = 0
    var answer = 0

    for i in 0..<cards.count {
        var visited = Array(repeating: false, count: cards.count)

        var value = cards[i] - 1 // 처음 선택한 BOX, 그리고 그 안에 있는 값으로 다음번 index 구함.
        var cnt = 0 // 그룹의 수 계산하기 위한 변수
        while true {
            if !visited[value] {
                visited[value] = true // 상자 열었다 !
                let next = cards[value] - 1 // 다음 인덱스 계산
                value = next //
                cnt += 1 // 그룹 수 += 1
            } else {
                // 이미 연 상자로 왔다면
                if cards.count == cnt { // 그 때 연 상자 개수가 전체 상자 개수와 똑같다면
                    return 0 // 점수는 0. (문제에 제시된 조건임)
                }
                break // 두번째 그룹 뽑으러 ㄱㄱ !
            }
        }

        first = cnt // 첫번째 그룹 수

        for j in 0..<cards.count {
            if visited[j] { continue } // 첫번째 선택한 그룹제외해야해

            var sec = cards[j] - 1 // 다음번 인덱스가 계속해서 담길 변수
            var secCnt = 0 // 두번째 선택한 그룹 수

            var history: [Int] = [] // visited배열을 초기화하기 위해 history에 두번째 그룹이 골랐던 애들 저장해두기
            while true {
                if !visited[sec] {
                    visited[sec] = true
                    history.append(sec) // history 저장
                    let next = cards[sec] - 1
                    sec = next
                    secCnt += 1
                } else {
                    break
                }
            }

            answer = max(answer, first * secCnt) // 첫번째 그룹 수 * 두번째 그룹 수 최대값 갱신

            // visited 두번째 방문한애들은 다른 경우를 탐색할 때 영향을 주면 안되기 때문에 초기화
            history.forEach { sec in
                             visited[sec] = false
            }
        }

    }
    // print(answer)



    return answer
}
