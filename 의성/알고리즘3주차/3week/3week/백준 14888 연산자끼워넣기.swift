//
//  백준 14888 연산자끼워넣기.swift
//  3week
//
//  Created by uiskim on 2023/08/22.
//

import Foundation

/*
2            : 숫자의 갯수
5 6          : 숫자
0 0 1 0      : 연산자의 갯수(+,-,*,%)
*/

let numberCount = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map{Int(String($0))!}
var operatorCounts = readLine()!.split(separator: " ").map{Int(String($0))!}

var results: [Int] = []

/// depth 1에서 시작해야하는 이유
/// 1. depth가 1부터 시작해야 1번index의 값과 계산을 하는 첫번째 cycle이 돌아감
/// 2. depth가 0부터 시작하면 if depth == numberCounter가 항상 false임
/// 왜냐면 numberCount는 6인데 depth는 5까지만 커지고 return되면서 다시줄어듦, 최대가 5가되어서 input을 append할수 없게됨
func dfs(_ input: Int, depth: Int) {
    if depth == numberCount {
        results.append(input)
        return
    }

    for (idx, value) in operatorCounts.enumerated() where value != 0 {
        operatorCounts[idx] -= 1
        /// 왜 for문 안에다가 sum값을 업데이트 시켜줘야하는가?
        /// for문이 돌때마다 == 같은 depth에서 부호가 바뀔때마다 처음값에서 연산을 해줘야한다
        /// 만약에 for문 밖에 있으면 for문이 돌때마다 값이 누적된다(depth가 클때 = 값누적)같은 depth에서는 값이 독립적이어야함
        /// 값이 dfs의 input parameter에 독립적이어야한다
        var sum = input
        switch idx {
        case 0:
            sum += numbers[depth]
        case 1:
            sum -= numbers[depth]
        case 2:
            sum *= numbers[depth]
        case 3:
            sum /= numbers[depth]
        default:
            break
        }
        dfs(sum, depth: depth+1)
        
        /// 기존에 사용했던 연산자를 다시 복구해줘야하는 이유
        /// 같은depth에서 다음 cycle로 넘어간다는것은 원래 사용했던 연산자가 아닌 다른연산자를 쓰겠다는 의미이므로
        /// 원래사용했던 연산자를 원래 갯수로 돌려준다음에 다음 cycle로 넘어가야한다
        operatorCounts[idx] += 1
    }
}

dfs(numbers[0], depth: 1)
print(results.max()!)
print(results.min()!)
