//
//  백준 4673 셀프넘버.swift
//  3week
//
//  Created by uiskim on 2023/08/22.
//

import Foundation

var notSelfNumbers: Set<Int> = []

for i in 1...10000 {
    notSelfNumbers.insert(d(i))
}

for i in 1...10000 {
    if !notSelfNumbers.contains(i) {
        print(i)
    }
}

func d(_ input: Int) -> Int {
    //return input + String(input).reduce(0, {$0+Int(String($1))!})
    
    /// swift에서 reduce의 경우에 for문보다 1.1배 느리다
    var sum = 0
    for i in String(input) {
        sum += Int(String(i))!
    }
    return input + sum
}
