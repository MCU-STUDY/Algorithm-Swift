//
//  후보키.swift
//  algo-swift-MCU
//
//  Created by 김민재 on 10/30/23.
//

import Foundation


func solution(_ relation:[[String]]) -> Int {
    // 조합도 염두
    // 1 ~ 20 n
    // 1 ~ 8 m
    
    // 하나만으로 다 구별이 가능하다 ? 일단 최소성 때문에 얘는 이 경우밖에 없음
    // 예를 들어 학번 + @ 이런 게 최소성에 어긋나기 때문에 안된다는 말
    
    // 그렇다면 이제 2개인 경우 ?
    // (int, int) 이런거 키값으로 Set만들었을 때 원본이랑 개수가 똑같은지를 비교하면 된다.
    
    // 그렇다면 이제 3개인 경우 ?
    // 근데 이 때 여기서 1개인 경우랑 2개인 경우에서 계산된 애들은 제외시켜줘야 함.
    
    // ... 이런식으로 반복
    
    // 결국 outer loop는 일단 1개 부터 col의 종류까지 도는 것이 Outer loop
    // 그리고 조합 문제라는 것도 일단 알겠음 그러니까 조합을 구현해보자 어제 연습했잖아ㅋㅋ
    func combi(_ arr: [Int], _ target: Int) -> [[Int]] {
        var results: [[Int]] = []
        let n = arr.count
        func comb(_ index: Int, _ now: [Int]) {
            if now.count == target {
                results.append(now)
                return
            }
            
            for i in index..<n {
                comb(i + 1, now + [arr[i]])
            }
        }
        comb(0, [])
        return results
    }
    
    
    let row = relation.count
    let col = relation[0].count
    
    let colList = Array((0..<col))
    
    var history = Set<[Int]>()
    
    var answer = 0
    
    for target in 1...col { // 키의 개수를 몇개로 할지 ?
        // print("Target == ", target)
        let keys = combi(colList, target)
        
        for key in keys { // 그 개수에 따른 키가 될 수 있는 모든 경우의 수를 돌면서..
            // var setKeys = Set<Any>()
            let key: [Int] = key
            // print("key == ", key)
            
            
            var setKeys = Set<[String]>()
            
            var t: [[String]] = Array(repeating: [], count: row)
            for k in key {
                for r in 0..<row {
                    t[r].append(relation[r][k])
                }
            }
            // print(t)
            for k in t {
                setKeys.insert(k)
            }
            
            // print("sdfjlaskdjflksadjflkjsadklfjlsdjflk")
            // print(setKeys)
            
            if setKeys.count != row { // 개수가 달라서 '유일성' 원칙에 어긋남.
                continue
            }
            
            // 여기까지 왔다라는 거면. 유일성은 충족하는데 이제 최소성 조건을 확인해줘야함.
            // 즉, [1,2,3] 이 가능한데, [1, 2]가 이미 있다면 [1,2,3]은 최소성 조건에 어긋나기 때문에 포함시키면 안됨.
            
            var isFullfilled = true
            for his in history {
                // print(his)
                let s = Set(key)
                let h = Set(his)
                // print(s, "포함되나?")
                // print(s.isSubset(of: his))
                /*
                [1, 2]
                [3, 1, 2] 포함되나?
                false
                */
                if h.isSubset(of: s) {
                    isFullfilled = false
                    break
                }
            }
            
            if isFullfilled { // 최소성 조건까지 통과했으면 + 1
                history.insert(key)
                answer += 1
            }
        }
        
    }
    
    // print(answer)
    return answer
}
