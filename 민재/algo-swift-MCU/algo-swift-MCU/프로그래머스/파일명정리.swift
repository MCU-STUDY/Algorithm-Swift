//
//  파일명정리.swift
//  algo-swift-MCU
//
//  Created by 김민재 on 10/5/23.
//

import Foundation

func solution(_ files:[String]) -> [String] {

    var sorting: [[String]] = []

    for file in files {
        var str = file
        var file = Array(file)

        var head = ""
        var number = ""
        var tail = ""

        var numberStartIdx = 0
        for i in 0..<file.count {
            if file[i].isNumber {
                numberStartIdx = i
                break
            }
            head += String(file[i])
        }

        var count = 0
        var lastIdx = -1
        for i in numberStartIdx..<file.count {
            if !file[i].isNumber || count > 5 {
                lastIdx = i
                break
            }
            count += 1
            number += String(file[i])
        }

        if lastIdx > 0 {
            for i in lastIdx..<file.count {
                tail += String(file[i])
            }
        }

        sorting.append([head, number, tail, str])
    }

    var answer = sorting.sorted { a, b in
                                 let origin1 = a[3]
                                 let origin2 = b[3]

                                 let head1 = a[0].uppercased()
                                 let head2 = b[0].uppercased()

                                 let number1 = Int(a[1])!
                                 let number2 = Int(b[1])!
                                 // print("origin1 = ", origin1, number1)
                                 // print("origin2 = ", origin2, number2)
                                 let tail1 = a[2]
                                 let tail2 = b[2]



                                 if head1 == head2 {
                                     if number1 == number2 {
                                         // print("1")
                                         return false
                                     }
                                     return number1 < number2
                                 }
                                 return head1 < head2

    }.map { a in
           return a[3]
    }

    // print(answer)

    return answer
}
