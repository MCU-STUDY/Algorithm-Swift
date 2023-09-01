//
//  Hash.swift
//  algorithm
//
//  Created by 황찬미 on 2023/08/31.
//

// key가 문자열인 해시 테이블임.
var hashTable: [String?] = Array(repeating: nil, count: 10)

// 해시 함수 생성
func hash(key: Int) -> Int {
    return key % 10
}

// 해시 함수 값 생성
func updateValue(key: String, value: String) {
    // key에 대한 unicode int 값 계산
    guard let unicode = UnicodeScalar(key)?.value else { return }
    let hashTableIndex = hash(key: Int(unicode))
    hashTable[hashTableIndex] = value
}

// 값 가져오기
func getValue(key: String) -> String? {
    guard let unicode = UnicodeScalar(key)?.value else { return nil }
    let hashTableIndex = hash(key: Int(unicode))
    return hashTable[hashTableIndex]
}

// 값 삭제
func removeValue(key: String) {
    guard let unicode = UnicodeScalar(key)?.value else { return }
    let hashTableIndex = hash(key: Int(unicode))
    hashTable[hashTableIndex] = nil
}

