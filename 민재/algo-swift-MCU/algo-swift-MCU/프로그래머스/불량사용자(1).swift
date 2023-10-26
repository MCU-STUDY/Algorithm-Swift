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
    
    
       
    var candidates = Set<Set<String>>()
    
    func dfs(_ userIds: [String], _ banIdx: Int, _ history: Set<String>) {
        var tmp = userIds
        var history = history
        
        if banIdx == banned_id.count {
            print(history)
            candidates.insert(history)
            return
        }
        
        
        for userId in tmp {
            if isBan(userId, banned_id[banIdx]) {
                history.insert(userId)
                
                tmp = userIds.filter { $0 != String(userId) }
                dfs(tmp, banIdx + 1, history)
                tmp = userIds
            }
        }
    }
    
    dfs(user_id, 0, [])
    
    return candidates.count
}

let a = solution(["frodo", "fradi", "crodo", "abc123", "frodoc"]    , ["fr*d*", "*rodo", "******", "******"]    )
print(a)
