//
//  백준 기업투자.swift
//  algo-swift-MCU
//
//  Created by 김민재 on 11/9/23.
//

import Foundation

/*
 Brute Force로 문제를 풀려고 한다면 ?
 시간복잡도를 계산해보자.
 
 1~20개의 기업이 있는데, 한 기업 당 1 ~ 300의 투자금액당 이익이 있다.
 각각의 기업 당 투자하는 경우와 투자하지 않는 경우 -> 2^20
 투자했을 시에는 300의 경우의 수 존재
 => (투자했을 때 + 투자안했을 때)^20
 => (300 + 1)^20 말도 안되는 시간복잡도가 나오기에 DP !!
 
  dp[i][j]
 i번째 회사까지 j만큼의 돈(무게)이 있을 때
 
 최대이익을 결정하는 변수들
 - 기업
 - 투자 액수
 
 고로, 2차원 dp table이 필요하다.
 
 (i, j)는 i번째 기업까지 있을 때 최대 j만큼의 돈에서의 최대 이익.
 
 투자안하는 경우: dp[i-1][j]
 
 투자하는 경우에는 여기서 for문이 필요함.
 왜?
 그 회사에 1~j까지의 돈을 투자하는 경우가 존재함.
 이 때 1~j를 순회하는 값에 대한 변수가 k라고 할 때, 아래와 같은 점화식이 나온다.
 
 dp[i][j]를 결정지을 때 고려해야하는 경우는 2가지 경우.
 - 투자를 안하는 경우: 이 경우는 위의 식에 해당됨.
 - 투자하는 경우: 투자하는 경우에는 i-1, 즉 이전 기업까지 있었을 때 지금 보고 있는 기업을 투자하는 경우이기 때문에 dp[i-1][j-k] + value[k]가 된다.
 투자하는 경우: max(dp[i-1][j], dp[i-1][j-k] + map[k][i])
 (k는 1~j)
 
 map[][] : 기업에 k만큼 투자했을 때 얻을 수 있는 이익금.
 근데 map에서 행이 투자액수니까 map[k][]
 그리고 뒤에 들어갈 애는 기업에 대한 인덱스, 즉 i
 
 
 + 추가로 한가지 더 메모이제이션 테이블이 필요함.
 어떤 것에 대한 메모냐면, 바로 "어떤 기업에 투자했는지"에 대한 정보를 메모이제이션하는 테이블.
 그렇다면 언제 그것을 기록하냐 ?
 dp[i][j]를 결정지을 때 "투자하기로 결정한 시점"에 (i, j)를 저장해놓고
 마지막에 이를 역추적하여 투자 한 기업들을 구할 수 있다.
 
 outer 기업
 inner 돈
 */

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0] // 투자 금액
let m = input[1] // 투자 가능한 기업들의 수

var map: [[Int]] = [Array(repeating: 0, count: m + 1)]
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    map.append(input)
}

var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: n + 1), count: m + 1)

var memoTable: [[Int]] = Array(repeating: Array(repeating: 0, count: n + 1), count: m + 1)

for i in 1...m { // 기업
    for j in 1...n { // j만큼의 돈
        // 투자 안한경우 vs i기업에 올인
        dp[i][j] = max(dp[i-1][j], map[j][i])
        memoTable[i][j] = dp[i][j] == map[j][i] ? j : 0
        
        for k in 1..<j {
            let money = dp[i-1][j-k] + map[k][i]
            if money > dp[i][j] {
                dp[i][j] = money
                memoTable[i][j] = k
            }
        }
    }
}
//for i in 1...m { // 기업
//    for j in 1...n { // j만큼의 돈
//        
//        for k in 0...j {
//            let money = dp[i-1][j-k] + map[k][i]
//            
//            if money > dp[i][j] {
//                dp[i][j] = money
//                memoTable[i][j] = k
//            }
//        }
//    }
//}

var answer: [Int] = []
var comp = m
var money = n


while comp > 0 {
    let howMuch = memoTable[comp][money]
    answer.append(howMuch)
    
    money -= howMuch
    comp -= 1
}
print(dp[m][n])
Array(answer.reversed()).forEach {
    print($0, terminator: " ")
}

/*
 예시1)
 4 3
 1 5 1 2
 2 6 5 4
 3 7 9 11
 4 8 15 12
 
 solution result
 0 0 0 0 0
 0 5 6 7 8
 0 5 6 10 15
 0 5 7 11 16
 
 예시2)
 4 2
 1 5 1
 2 6 5
 3 7 9
 4 10 15
 wrong result:
 0 0 0 0 0
 0 5 6 7 10
 0 5 6 10 15
 
 예시3)
 4 3
 1 5 1 3
 2 6 5 5
 3 7 9 7
 4 10 12 10
 solution result:
 0 0 0 0 0
 0 5 6 7 10
 0 5 6 10 14
 0 5 8 10 14
 
 [memoTable]
 0 0 0 0 0
 0 1 2 3 4
 0 0 0 2 3
 0 0 1 0 0
 
 1 3 0
 wrong result:
 0 0 0 0 0
 0 5 6 7 10
 0 5 6 10 14
 0 5 8 10 14
 
 [memoTable]
 0 0 0 0 0
 0 0 0 0 0
 0 0 0 2 3
 0 0 1 0 0
 
 0 3 0
 
 
 */
