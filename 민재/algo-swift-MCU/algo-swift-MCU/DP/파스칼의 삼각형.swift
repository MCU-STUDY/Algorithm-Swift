//
//  파스칼의 삼각형.swift
//  algo-swift-MCU
//
//  Created by 김민재 on 10/7/23.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let k = input[1]

var dp = Array(repeating: Array(repeating: 0, count: n + 2), count: n + 1)

func recur(_ n: Int, _ k: Int) -> Int {
//    print(n, k)
    // 두번째 행 || 왼쪽 끝 || 오른쪽 끝
    if n == 2 || k == 1 || k == n {
//        print("(\(n), \(k)) 그냥 1 리턴 !")
        return 1
    }

    if dp[n][k] != 0 {
//        print("dp[\(n)][\(k)] return \(dp[n][k]) ! ")
        return dp[n][k]
    }

    dp[n][k] = recur(n - 1, k - 1) + recur(n - 1, k)
//    print("dp[\(n)][\(k)] = ", dp[n][k])

    return dp[n][k]
}


let answer = recur(n, k)

print(answer)


/*
dp로 풀 수 있다. 왜? 아래서부터 위로 생각해보면..

 6를 기준으로 보자.

 6은 위의 행 3과 3의 합이다. 재귀적으로 3은 또 3의 위의 행 2와 1의 합이다. 또 2는 1과 1의 합이다.
 이런식으로 큰 문제가 작은 문제들의 합으로 나타낼 수 있다. (조건 1 클리어)

 그리고 중복되는 계산이 존재하는가? 존재한다.
 6은 3과 3의 합인데, 3은 각 각 자신의 위의행 2와 1의 합이다. 여기서 중복계산이 발생한다. (조건 2 클리어)

 그렇다면 이 문제는 DP로 풀 수 있다는 뜻.

 이제 점화식을 세워보자.

 */
