//
//  pg_17682.swift
//  algorithm
//
//  Created by 황찬미 on 2023/09/15.
//
//  [1차] 다트 게임
//  https://school.programmers.co.kr/learn/courses/30/lessons/17682

import Foundation

func solution(_ dartResult:String) -> Int {
    // 다트 3번
    // 점수 0점에서 10점까지 10과 1, 0을 구분해야 함.
    // * 해당 점수랑 이전 점수 2배 (첫 다트에 나왔을 때는 첫 점수만 2배), 중첩 가능
    // # 점수 마이너스, *랑 중첩 가능 -2
    
    // 새로운 문자열을 만들어 준다
    
    let dartArray = Array(dartResult).map{String($0)}
    
    var result = [Int]()
    
    var index = 0
    var numberStr = ""
    
    while index < dartResult.count-1 {
        
        // 숫자 1, 0일때, 10일때를 구분하기
        while let number = Int(dartArray[index]) {
            numberStr += String(number)
            index += 1
        }
        
        // 숫자
        var number = Int(numberStr)!
        numberStr = ""
        
        if dartArray[index] == "S" {
            number = Int(pow(Double(number), 1))
        } else if dartArray[index] == "D" {
            number = Int(pow(Double(number), 2))
        } else {
            number = Int(pow(Double(number), 3))
        }
        
        // index 증가
        index += 1
        
        // 뒤에 옵션이 없을 경우
        if index == dartResult.count {
            result.append(number)
            break
        }
        
        if dartArray[index] == "*" {
            // 같이 곱해줄 앞의 값이 없다면
            if result.isEmpty {
                number = number*2
                result.append(number)
            } else {
                let frontData = result[result.count-1]
                result[result.count-1] = frontData*2
                result.append(number*2)
            }
        } else if dartArray[index] == "#" {
            result.append(-number)
        } else {
            // option이 없어서 숫자일 경우
            result.append(number)
            continue
        }
        
        index += 1
    }
    
    return result.reduce(0, +)
}

print(solution("1S2D*3T"))
