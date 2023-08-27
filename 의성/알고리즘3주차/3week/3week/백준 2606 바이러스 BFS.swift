//
//  백준 2606 바이러스.swift
//  3week
//
//  Created by uiskim on 2023/08/25.
//

import Foundation

/// 기존에 구현했던 방식 = dictionary
/// 이렇게 해보니까 불편한점이 발생함
/// key가 있는지 없는지 확인하고 key에다가 element를 array로 감싼값을 대입해줘야함
/// 그리고 양방향을 구현하기가 까다로움, 그러다보니 optional unwrapping문제가 발생함(강제언래핑해줘야함)
//func makeGraph(input: [[Int]]) -> [Int:[Int]] {
//    var graph: [Int:[Int]] = [:]
//    for element in input {
//        if !Array(graph.keys).contains(element[0]) {
//            graph[element[0]] = [element[1]]
//        } else {
//            graph[element[0]]?.append(element[1])
//        }
//    }
//    return graph
//}

/// 변화된 구현방식
/// graph의 1번 element는 1번 노드가 가리키고있는 노드
/// Array이기때문에 array만 만들어놓으면 양방향 구현이 쉬움
/// index에따라 자동으로 nil을 할당해줌

let numberOfComputer = Int(readLine()!)!
let count = Int(readLine()!)!
var graph: [[Int]] = Array(repeating: [], count: numberOfComputer+1)
for _ in 0..<count {
    let element = readLine()!.split(separator: " ").map{Int(String($0))!}
    graph[element[0]].append(element[1])
    graph[element[1]].append(element[0])
}
var isVisited = Array(repeating: false, count: numberOfComputer+1)

/// 이문제를 처음봤을때 들었던생각
/// 결국은 끝까지 타고들어가야하기때문에 DFS로 풀어야한다
/// 결국 연결된 모든 노드를 찾아야하는 문제는 DFS로 푸나 BFS로 푸나 차이가 없다
///
/// 1. BFS로 먼저 풀어보기
func bfs(start: Int) -> Int {
    var queue = [start]
    var index = 0
    
    isVisited[start] = true
    
    while queue.count > index {
        let value = queue[index]
        for element in graph[value] {
            if !isVisited[element] {
                isVisited[element] = true
                queue.append(element)
            }
        }
        /// bfs에서 중요한건 head를 언제 +1해주냐인데
        /// 노드에서 다음 노드를 전부 append해준다 == 탐색할 노드들을 전부 리스트업
        /// index를 한칸 높여서 탐색할 노드들중에 첫번째노드부터 탐색한다
        index += 1
    }
    return queue.count - 1
}

print(bfs(start: 1))
