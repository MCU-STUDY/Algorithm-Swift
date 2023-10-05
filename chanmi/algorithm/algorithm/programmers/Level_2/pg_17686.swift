//
//  pg_17686.swift
//  algorithm
//
//  Created by 황찬미 on 2023/10/05.
//
//  [3차] 파일명 정렬
//  https://school.programmers.co.kr/learn/courses/30/lessons/17686

import Foundation

func solution(_ files:[String]) -> [String] {
    // head 대문자 변환 (숫자가 아닌 문자)
    // head가 같다면, number 숫자순으로 정렬, 앞의 0은 무시됨. (숫자)
    // tail은 상관없음 (그이외의 것, 하지만 들어온 순서를 유지해야 됨)
    
    let upperFiles = files.map{ $0.uppercased() }
    var array = [(originalCase: String, head: String, number: Int, originalIndex: Int)]()
    
    for (index, file) in upperFiles.enumerated() {
        let nowFile = upperFiles[index]
        let fileArray = nowFile.map{String($0)}
        
        var head = ""
        var number = ""
        
        // head일 때랑 tail일 때는 구분해서 값을 넣어주귀
        for j in 0..<fileArray.count {
            
            // tail일 경우
            if head != "" && number != "" && Int(fileArray[j]) == nil { break }
            
            // number일 경우
            if let _ = Int(fileArray[j]) {
                number += fileArray[j]
                continue
            }
            
            // 전부 포함안되면 head이기 때문에
            head += fileArray[j]
        }
        
        array.append((originalCase: files[index], head: head, number: Int(number)!, originalIndex: index))
        
    }
    
    // head를 기준으로 먼저 정렬
    let sortedArray = array.sorted {
        if $0.head == $1.head {
            if $0.number == $1.number {
                return $0.originalIndex < $1.originalIndex
            }
            return $0.number < $1.number
        }
        return $0.head < $1.head
    }.map {
        $0.originalCase
    }

    return sortedArray
}

_ = solution(["img12.png", "img10.png", "img02.png", "img1.png", "IMG01.GIF", "img2.JPG"])


