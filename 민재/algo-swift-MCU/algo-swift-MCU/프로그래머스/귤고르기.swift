//
//  귤고르기.swift
//  algo-swift-MCU
//
//  Created by 김민재 on 10/8/23.
//

import Foundation

func solution(_ k:Int, _ tangerine:[Int]) -> Int {

    var tang = tangerine.sorted()

    var countArr = Array(repeating: 0, count: tangerine.max()! + 1)

    for tan in tang {
        countArr[tan] += 1
    }

    countArr.sort(by: >)

    var accu = 0
    var sizeCnt = 0
    for i in 0..<countArr.count {
        accu += countArr[i]
        sizeCnt += 1
        if accu >= k {
            break
        }
    }


//     var dict: [Int: Int] = [:]

//     for tan in tang {
//         dict[tan, default: 0] += 1
//     }

//     var tmp = Array(dict.values).sorted(by: >)

    // var accu = 0
    // var sizeCnt = 0
    // for t in tmp {
    //     accu += t
    //     sizeCnt += 1
    //     if accu >= k {
    //         break
    //     }
    // }




    return sizeCnt
}
