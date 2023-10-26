import Foundation

func solution(_ order:[Int]) -> Int {
    // 12345
    //
    //
    // 123
    var belt: [Int] = [] // queue
    var qIdx = 0
    
    for i in 1...order.count {
        belt.append(i)
    }
    var order = Array(order.reversed())
    var subBelt: [Int] = [] // stack
    
    var count = 0
    var history = Set<Int>()
    // order가 있을 때
    while let ord = order.last {
        // print("order == ", ord)
        if qIdx < belt.count {
            let mainBelt = belt[qIdx]
            
            // print("mainBelt  = ", mainBelt)
            if mainBelt != ord {
                if subBelt.count > 0 && subBelt[subBelt.count - 1] == ord {
                    order.removeLast()
                    subBelt.removeLast()
                    history.remove(ord)
                    count += 1
                    // print("요기잉네 ! ", ord)
                    // print(subBelt)
                } else {
                    
                    if !history.contains(mainBelt) {
                        subBelt.append(mainBelt)
                        history.insert(mainBelt)
                        qIdx += 1
                        // print("일단 서브에 저장..")
                        // print(subBelt)
                        // print("history = ", history)
                        
                    }
                }
            } else {
                count += 1
                order.removeLast()
                qIdx += 1
                // print(ord, "딱 맞았네 이거 바로 빼 ")
            }
        } else {
            if subBelt.count > 0 && subBelt[subBelt.count - 1] == ord {
                subBelt.removeLast()
                order.removeLast()
                count += 1
            } else {
                break
            }
        }
        
    }
    
    // print(count)
    return count
}
