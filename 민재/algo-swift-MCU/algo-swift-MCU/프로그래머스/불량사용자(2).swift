import Foundation

func isBan(_ lhs: String, _ rhs: String) -> Bool {
    if lhs.count != rhs.count {
        return false
    }

    let userIdArr = Array(lhs)
    let bannedArr = Array(rhs)

    var flag = true
    for i in 0..<userIdArr.count {
        let st = String(bannedArr[i])
        let userSt = String(userIdArr[i])
        // print("st = ", st, " 랑 userSt", userSt)

        if st != "*" && userSt != st { // "*"도 아닌데, 다른 문자면 X
            flag = false
            break // 끝, 다음 userId 확인하러감
        }
        else if st == "*" || st == userSt { // "*"이면 어떤 문자든 상관X || 같은 문자면 O
            continue
        }
    }

    return flag
}


func solution(_ user_id:[String], _ banned_id:[String]) -> Int {

    var graph: [[String]] = Array(repeating: [], count: banned_id.count)

    for banIdx in 0..<banned_id.count {
        for userId in user_id {
            if isBan(userId, banned_id[banIdx]) {
                graph[banIdx].append(userId)
            }
        }
    }


    var tmpSet = Set<String>()

    var candidates = Set<Set<String>>()

    func dfs(_ banIdx: Int) {
        if banIdx == banned_id.count {
            candidates.insert(tmpSet)
            return
        }

        for v in graph[banIdx] {
            if !tmpSet.contains(v) {
                tmpSet.insert(v)
                dfs(banIdx + 1)
                tmpSet.remove(v)
            }
        }
    }

    dfs(0)

    return candidates.count
}
