//
//  백준 15649 N과M(1).swift
//  3week
//
//  Created by uiskim on 2023/08/31.
//

import Foundation

/// 15649번
/// N과 M(1)

/// isVisited사용
let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1]
var visited = [Bool](repeating: false, count: n + 1)

func dfs(nums: [Int]) {
    /// 가지치기
    if nums.count == m {
        nums.forEach { print($0, terminator: " ") }
        print()
        return
    }
    
    /// 이경우는 노드끼리의 value가 중복이 있는상태를 나타냄
    /// 지금까지의 예제는 각 노드의 value가 unique했어서 visited가 같을때 다른 value가 없었는데
    /// 숫자들의 list를 가지고 조합을 구할때는 왼쪽의 1과 오른쪽의 1은 다른 value로 봐야하기때문에 visited를 초기화 시켜줘야한다
    ///
    /// 예를들어서 input으로 [1,2]가 들어오더라도
    /// [1,2,3,4]와 비교해서 1을 방문했고 2를방문했으니 다음에 3을 넣자!의 느낌임
    for i in 1...n {
        if !visited[i] {
            visited[i] = true
            dfs(nums: nums + [i])
            /// 모든 경우의 수
            /// 1번레벨 (empty) 2번레벨 (1) (2) (3) (4)
            visited[i] = false
        }
    }
}

dfs(nums: [])
